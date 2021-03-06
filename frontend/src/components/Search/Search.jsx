import React, { useState, useRef } from 'react';
import { useSelector } from 'react-redux';

import { Form } from 'react-bootstrap';
import { selectAllAvailableProducts } from '../../store/sellersSlice';
import './Search.css';

export const Search = ({ handleSearch, setSearchResult }) => {
  const [searchInput, setSearchInput] = useState('');
  const allProducts = useSelector((state) => selectAllAvailableProducts(state));
  const [suggestions, setSuggestions] = useState(allProducts);

  const suggestionsBlock = useRef(null);

  const handleInputChange = (e) => {
    const newVal = e.target.value;
    suggestionsBlock.current.className = 'suggestions';

    setSearchInput(newVal);
    setSearchResult(newVal);
    newVal === ''
      ? setSuggestions(allProducts)
      : setSuggestions(
          allProducts.filter((item) =>
            item.toLowerCase().includes(newVal.toLowerCase())
          )
        );
    handleSearch(newVal.toLowerCase());
  };

  const handleItemClick = (e, product) => {
    setSearchResult(product);
    setSearchInput('');
    setSuggestions([]);
    handleSearch(product);
    suggestionsBlock.current.className = 'suggestions  suggestions--hidden';
  };

  const handleBlur = (e) => {
    setSearchInput('');
    suggestionsBlock.current.className = 'suggestions  suggestions--hidden';
  };

  return (
    <div className="search-container">
      <Form.Control
        type="text"
        placeholder="Search by product name"
        style={{ margin: '1rem', marginLeft: '0' }}
        value={searchInput}
        onChange={(e) => handleInputChange(e)}
        onBlur={(e) => handleBlur(e)}
      />
      <ul ref={suggestionsBlock} className="suggestions  suggestions--hidden">
        {suggestions.map((product) => {
          return (
            <li
              key={product}
              onMouseDown={(e) => handleItemClick(e, product)}
              className="suggestion"
            >
              {product}
            </li>
          );
        })}
      </ul>
    </div>
  );
};
