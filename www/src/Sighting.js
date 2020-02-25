import React, { useState } from 'react'
import './Sighting.css'
import { InfoWindow, Marker } from 'react-google-maps'

export default ({
  alienType,
  alienDescription,
  position,
  severity,
  sightingDate,
  sightingCount,
  svgPath,
  severityColor
}) => {
  const [infoOpen, setInfoOpen] = useState(false)

  return (
    <Marker
      position={position}
      onClick={() => setInfoOpen(!infoOpen)}
      icon={{
        path: svgPath,
        fillColor: severityColor,
        fillOpacity: 0.9,
        strokeWeight: 0,
        scale: 0.08
      }}
    >
      {infoOpen && (
        <InfoWindow>
          <div className='alien-card'>
            <svg
              fill={severityColor}
              viewBox='0 0 512 512'
              stroke='black'
              strokeWidth='4'
            >
              <path d={svgPath} />
            </svg>
            <h2>
              A wild {alienType} appeared!
              <br />
            </h2>

            <div className='alien-description'>
              <p>
                Severity: <b style={{ color: severityColor }}>{severity}/10</b>
              </p>
              <p>Report Date: {sightingDate.toLocaleTimeString()}</p>
              <p>Confirmed Sightings: {sightingCount}</p>
              <p>{alienDescription}</p>
            </div>
          </div>
        </InfoWindow>
      )}
    </Marker>
  )
}
