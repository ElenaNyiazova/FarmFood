import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { NavDropdown } from 'react-bootstrap';

import { selectedCityChanged } from '../../../store/citiesSlice';
import './CitiesDropdown.css';

export const CitiesDropdown = ({ theme }) => {
  const selectedCity = useSelector((state) => state.cities.selectedCity);
  const allCities = useSelector((state) => state.cities.allCities);
  const dispatch = useDispatch();

  const handleCityChange = (newCity) => {
    const citiesCont = document.querySelector('.header__cities-container');
    citiesCont.classList.remove('header__cities-container--visible');
    dispatch(selectedCityChanged(newCity));
  };

  const navDropdownItems = allCities.map((city) => {
    if (city === selectedCity) {
      return;
    }
    return (
      <NavDropdown.Item key={city} onClick={(e) => handleCityChange(city)}>
        {city}
      </NavDropdown.Item>
    );
  });

  const themeClasses = theme
    ? 'cities-dropdowm__txt  cities-dropdowm__txt--dark'
    : 'cities-dropdowm__txt';

  return (
    <NavDropdown
      title={selectedCity}
      id="basic-nav-dropdown"
      className={themeClasses}
    >
      {navDropdownItems}
    </NavDropdown>
  );
};
