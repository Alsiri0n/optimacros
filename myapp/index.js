require('dotenv').config();

const express = require('express');
const app = express();
const PORT = process.env.PORT;
const HOST = process.env.HOST;
// const PORT=8000;
// const HOST="0.0.0.0"

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(PORT, HOST, () => {
    console.log(`Running on http://${HOST}:${PORT}`);
  });