const express = require('express')
const redis = require('redis')
const app = express()
const process = require('process')
const client = redis.createClient({
  host: 'redis-server',
  port: 6379
})

client.set('visits', 0)

app.get('/', (req, res) => {
  // process.exit(0)
  client.get('visits', (err, visits) => {
    res.send('No of visits:' + visits)
    client.set('visits', parseInt(visits) + 1)
  })
})

app.listen(8081, () => {
  console.log('server is up and running')
})
