import React from 'react'
import { GoogleMap } from 'react-google-maps'
import Sighting from './Sighting'
import { gql } from 'apollo-boost'
import { useSubscription } from '@apollo/react-hooks'

const conferenceLocation = { lat: 26.0807983, lng: -80.2442118 }

export default () => {
  const { data } = useSubscription(
    gql`
      subscription {
        enriched_sightings(limit: 10, order_by: { sightingDate: desc }) {
          alienType
          alienDescription
          image
          latitude
          longitude
          severity
          severityColor
          sightingCount
          sightingDate
        }
      }
    `
  )

  const sightings =
    data && data.enriched_sightings
      ? data.enriched_sightings
          .map(a => {
            return {
              key: `${a.alienType}+${a.sightingCount}`,
              alienType: a.alienType,
              alienDescription: a.alienDescription,
              severity: a.severity,
              sightingDate: new Date(a.sightingDate),
              sightingCount: a.sightingCount,
              position: { lat: a.latitude, lng: a.longitude },
              alienImage: a.image,
              severityColor: a.severityColor
            }
          })
          .map(s => <Sighting key={s.key} {...s} />)
      : []

  return (
    <React.Fragment>
      <GoogleMap defaultZoom={11} defaultCenter={conferenceLocation}>
        {sightings}
      </GoogleMap>
    </React.Fragment>
  )
}
