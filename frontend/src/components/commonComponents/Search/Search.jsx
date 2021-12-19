import React, { useState, useRef } from 'react';

import { Form } from 'react-bootstrap';
import './Search.css';

export const Search = ({ handleSearch, suggestionsArray }) => {
  const [searchInput, setSearchInput] = useState('');

  const [suggestions, setSuggestions] = useState(suggestionsArray);

  const suggestionsBlock = useRef(null);

  const handleInputChange = (e) => {
    const newVal = e.target.value;
    suggestionsBlock.current.className = 'suggestions';
    setSearchInput(newVal);
    newVal === ''
      ? setSuggestions(suggestionsArray)
      : setSuggestions(
          suggestionsArray.filter((item) =>
            item.toLowerCase().includes(newVal.toLowerCase())
          )
        );
  };

  const handleItemClick = (e, product) => {
    setSearchInput('');
    setSuggestions([]);
    handleSearch(product);
    const searchCont = document.querySelector('.header__search-container');
    searchCont.classList.remove('header__search-container--visible');
  };

  const handleBlur = (e) => {
    setSuggestions([]);
  };

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    handleSearch(searchInput.toLowerCase());
    setSearchInput('');
    setSuggestions([]);
    const searchCont = document.querySelector('.header__search-container');
    searchCont.classList.remove('header__search-container--visible');
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
      </Form>
    </div>
  );
};
