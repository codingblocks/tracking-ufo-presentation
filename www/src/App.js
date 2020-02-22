import React from 'react'
import './App.css'
import { gql } from 'apollo-boost'
import { useSubscription } from '@apollo/react-hooks'

function App () {
  const { data } = useSubscription(
    gql`
      subscription {
        bitcoin_prices {
          close
          cap
          date
          high
          low
          open
          volume
        }
      }
    `
  )
  const prices = data ? data.bitcoin_prices : []

  return (
    <div className='App'>
      <header className='App-header'>
        <p>{JSON.stringify(data)}</p>
        <table>
          {prices.map(p => (
            <tr key={p.date}>
              <td>{p.date}</td>
              <td>{p.low}</td>
              <td>{p.high}</td>
              <td>{p.open}</td>
              <td>{p.volume}</td>
              <td>{p.cap}</td>
            </tr>
          ))}
        </table>
      </header>
    </div>
  )
}

export default App
