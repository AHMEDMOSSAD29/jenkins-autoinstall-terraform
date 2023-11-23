const express = require('express');
const app = express();
const port = 3000;
const name = "ahmed";

app.get('/', (req, res) => {
  const html = `
    <html>
      <head>
        <title>Greetings</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
          }
          h1 {
            color: #333;
          }
        </style>
      </head>
      <body>
        <h1>Hello, ${name}!</h1>
      </body>
    </html>
  `;
  
  res.send(html);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});

