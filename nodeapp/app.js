const express = require('express')
const app = express()
const port = 3000
const name = "ahmed"
app.get('/', (req, res) => {
    res.send('Hello World from ${name}')
  })
  
  app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
  })
