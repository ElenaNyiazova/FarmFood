import React, { useState } from 'react';
import { Dropdown } from 'react-bootstrap';

import {
  sortProductsByMinPrice,
  sortProductsByMaxPrice,
} from '../../../shared/shared';
import { SORTING } from '../../../consts/consts';
import './SortingDropdown.css';

export const SortingDropdown = ({ productsArray }) => {
  const [sortingBy, setSortingBy] = useState('Default sorting');

  const handleSortingDropdown = (sorting) => {
    setSortingBy(sorting);
    sorting === SORTING.MAX_PRICE_FIRST
      ? sortProductsByMinPrice(productsArray)
      : sortProductsByMaxPrice(productsArray);
  };

  return (
    <Dropdown className="sorting-dropdown">
      <Dropdown.Toggle
        className="sorting-dropdown__button"
        variant="white"
        id="dropdown-basic"
      >
        {sortingBy}
      </Dropdown.Toggle>
      <Dropdown.Menu>
        <Dropdown.Item
          className="sorting-dropdown__item"
          href="#/action-1"
          onClick={() => handleSortingDropdown(SORTING.MIN_PRICE_FIRST)}
        >
          {SORTING.MIN_PRICE_FIRST}
        </Dropdown.Item>
        <Dropdown.Item
          className="sorting-dropdown__item"
          href="#/action-2"
          onClick={() => handleSortingDropdown(SORTING.MAX_PRICE_FIRST)}
        >
          {SORTING.MAX_PRICE_FIRST}
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown>
  );
};
