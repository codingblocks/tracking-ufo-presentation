import React from 'react'
import { GoogleMap } from 'react-google-maps'
import Sighting from './Sighting'
import { GiAlienBug, GiSparkSpirit } from 'react-icons/gi'
import { gql } from 'apollo-boost'
import { useSubscription } from '@apollo/react-hooks'

const conferenceLocation = { lat: 26.0807983, lng: -80.2442118 }

export default () => {
  const { data } = useSubscription(
    gql`
      subscription {
        enriched_sightings(limit: 25, order_by: { sightingDate: desc }) {
          alienType
          alienDescription
          image
          latitude
          longitude
          severity
          severityColor
          sightingCount
          svg
          sightingDate
        }
      }
    `
  )

  const sightings = !!data
    ? data.enriched_sightings.map(a => {
        return {
          alienImage: <GiAlienBug fontSize='120' />,
          alienType: a.alienType,
          alienDescription: a.alienDescription,
          severity: a.severity,
          sightingDate: new Date(a.sightingDate),
          sightingCount: a.sightingCount,
          position: { lat: a.latitude, lng: a.longitude },
          svgPath: a.svg,
          severityColor: a.severityColor
        }
      })
    : []

  return (
    <React.Fragment>
      <GoogleMap defaultZoom={12} defaultCenter={conferenceLocation}>
        {sightings.map(s => (
          <Sighting key={`${s.alienType}-${s.sightingCount}`} {...s} />
        ))}
      </GoogleMap>
    </React.Fragment>
  )
}
