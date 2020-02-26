import React from 'react'
import { withScriptjs, withGoogleMap } from 'react-google-maps'
import Map from './Map'

export default withScriptjs(withGoogleMap(props => <Map />))
