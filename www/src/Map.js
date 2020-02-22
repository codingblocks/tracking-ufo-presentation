import React from 'react'
import { GoogleMap } from 'react-google-maps'
import Sighting from './Sighting'

const conferenceLocation = { lat: 26.0807983, lng: -80.2442118 }
export default () => {
  return (
    <React.Fragment>
      <GoogleMap defaultZoom={12} defaultCenter={conferenceLocation}>
        [<Sighting />]
      </GoogleMap>
    </React.Fragment>
  )
}
