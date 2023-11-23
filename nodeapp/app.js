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
            background-image: url('https://resources.github.com/assets/img/devops/social-card.png');
            background-size: cover;
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
  console.log(`App listening at port : ${port}`);
});

