const express = require('express');
const app = express();
const port = 3000;
const name = "ahmed mosaad";

app.get('/', (req, res) => {
  const html = `
    <html>
      <head>
        <title>Greetings</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-image: url('https://resources.github.com/assets/img/devops/social-card.png');
            background-size: cover;
          }
          .navbar {
            background-color: #333;
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
          }
          .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 10px;
            font-weight: bold;
          }
          .content {
            padding-top: 60px;
          }
          h1 {
            color: white;
          }
        </style>
      </head>
      <body>
        <div class="navbar">
          <a href="#">Home</a>
          <a href="#">About</a>
          <a href="https://www.linkedin.com/in/ahmed-mosaad-91239518a/">Contact</a>
        </div>
        <div class="content">
          <h1>Hello, from ${name}!</h1>
        </div>
      </body>
    </html>
  `;
  
  res.send(html);
});

app.listen(port, () => {
  console.log(`App listening at port : ${port}`);
});
