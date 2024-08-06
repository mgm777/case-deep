const express = require('express');
const cors = require('cors');
const app = express();
const port = 5500;

app.use(cors());
app.use(express.json());

let items = [];

app.get('/api/items', (req, res) => {
  res.json(items);
});

app.post('/api/items', (req, res) => {
  const newItem = req.body;
  items.push(newItem);
  res.status(201).json(newItem);
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running on http://localhost:${port}`);
});
