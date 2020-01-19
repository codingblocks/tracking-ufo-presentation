const prices = require('fs')
  .readFileSync('./bitcoin.txt', 'utf-8')
  .replace(/\r|,/g, '')

const lines = prices.split('\n')
const columns = 'date,open,high,low,close,volume,cap'.split(',')

// convert to [] of []
let i = 0
const output = [[]]
while (i < lines.length) {
  output.push([])
  for (let j = 0; j < columns.length; j++) {
    output[output.length - 1][j] = lines[i + j]
  }
  i += columns.length
}
output.pop() // last row is empty, let's just cheat and pop it out
console.log(output)

// fix the dates
output.forEach(r => {
  r[0] = new Date(r[0]).toString()
  console.log(r[0])
})

// convert to csv
const csv = output
  .reverse()
  .map(r => r.join(','))
  .join('\n')

require('fs').writeFileSync('bitcoin.csv', csv)
