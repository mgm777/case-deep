import React, { useState, useEffect } from 'react';
import axios from 'axios';

const App = () => {
  const [items, setItems] = useState([]);
  const [newItem, setNewItem] = useState('');

  useEffect(() => {
    axios.get('http://localhost:5500/api/items')
      .then(response => {
        setItems(response.data);
      })
      .catch(error => {
        console.error('There was an error fetching the items!', error);
      });
  }, []);

  const addItem = () => {
    axios.post('http://localhost:5500/api/items', { name: newItem })
      .then(response => {
        setItems([...items, response.data]);
        setNewItem('');
      })
      .catch(error => {
        console.error('There was an error adding the item!', error);
      });
  };

  return (
    <div>
      <h1>To-do App</h1>
      <ul>
        {items.map((item, index) => (
          <li key={index}>{item.name}</li>
        ))}
      </ul>
      <input
        type="text"
        value={newItem}
        onChange={(e) => setNewItem(e.target.value)}
      />
      <button onClick={addItem}>Add Item</button>
    </div>
  );
};

export default App;
