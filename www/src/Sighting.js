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
  alienImage,
  severityColor
}) => {
  const [infoOpen, setInfoOpen] = useState(false)

  return (
    <Marker
      position={position}
      onClick={() => setInfoOpen(!infoOpen)}
      icon={`http://localhost:3000/aliens/small/${alienImage}`}
    >
      {infoOpen && (
        <InfoWindow>
          <div className='alien-card'>
            <img src={`http://localhost:3000/aliens/large/${alienImage}`} />
            <h2>
              A wild {alienType} appeared!
              <br />
            </h2>

            <div className='alien-description'>
              <p>
                Severity: <b style={{ color: severityColor }}>{severity}/4</b>
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
