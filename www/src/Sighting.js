import React, { useState } from 'react'
import './Sighting.css'
import { InfoWindow, Marker } from 'react-google-maps'
import { GiAlienBug } from 'react-icons/gi'

// GiDread
// GiNunFace
// GiTransparentSlime
// GiAmberMosquito
// GiAnt
// GiAnubis
// GiAstronautHelmet
// GiBattleMech
// GiBrute
// GiBullyMinion
// GiCentaur
// GiChicken
// GiCigale
// GiClown
// GiDuck
// GiEagleHead
// GiElephantHead
// GiFishMonster
// GiGargoyle
// GiGoblinHead
// GiHelicoprion
// GiIceGolem
// GiInvisible
// GiJasonMask
// GiKenkuHead
// GiKlingon
// GiLed
// GiLuchador
// GiOgre
// GiPanda

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
            <GiAlienBug fontSize='120pt' />
            <h2>
              A wild {alienType} appeared!
              <br />
            </h2>

            <div className='alien-description'>
              <p>
                Severity: <b style={{ color: severityColor }}>{severity}</b>
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
