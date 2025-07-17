const express = require('express');
const app = express();
const port = process.env.PORT || 80;

app.get('/health', (req, res) => {
  res.send('OK');
});

app.get('/model/version', (req, res) => {
  res.json({ version: "v1.0.0" });
});

app.listen(port, () => {
  console.log(`Backend API listening on port ${port}`);
});
