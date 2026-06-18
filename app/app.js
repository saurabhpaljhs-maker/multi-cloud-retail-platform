const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h1>Retail Platform - Multi-Cloud Deployed!</h1><p>Order Processing Active</p>');
});

app.get('/health', (req, res) => res.status(200).send('OK'));
app.listen(port, () => console.log(`App running on port ${port}`));