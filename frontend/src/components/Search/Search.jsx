import React, { useState, useRef } from 'react';
import { useSelector } from 'react-redux';

import { Form } from 'react-bootstrap';
import { selectProductsIds } from '../../store/productsSlice';
import './Search.css';

export const Search = ({ handleSearch }) => {
  const [searchInput, setSearchInput] = useState('');
  const allProducts = useSelector((state) => selectProductsIds(state));
  const [suggestions, setSuggestions] = useState(allProducts);

  const suggestionsBlock = useRef(null);

  const handleInputChange = (e) => {
    const newVal = e.target.value;
    suggestionsBlock.current.className = 'suggestions';
    setSearchInput(newVal);
    newVal === ''
      ? setSuggestions(allProducts)
      : setSuggestions(
          allProducts.filter((item) =>
            item.toLowerCase().includes(newVal.toLowerCase())
          )
        );
  };

  const handleItemClick = (e, product) => {
    setSearchInput('');
    setSuggestions([]);
    handleSearch(product);
  };

  const handleBlur = (e) => {};

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    handleSearch(searchInput.toLowerCase());
    setSearchInput('');
    setSuggestions([]);
  };

  return (
    <div className="search__container">
      <Form
        className="search__form"
        onSubmit={handleSearchSubmit}
        onBlur={(e) => handleBlur(e)}
      >
        <Form.Control
          type="text"
          placeholder="Search by product name"
          className="search__input"
          value={searchInput}
          onChange={(e) => handleInputChange(e)}
        />
        <button type="submit" className="search__button">
          Submit
        </button>
      </Form>

      <ul ref={suggestionsBlock} className="suggestions  suggestions--hidden">
        {suggestions.map((product) => {
          return (
            <li
              key={product}
              onMouseDown={(e) => handleItemClick(e, product)}
              className="suggestion"
            >
              {product.toLowerCase()}
            </li>
          );
        })}
      </ul>
    </div>
  );
};
