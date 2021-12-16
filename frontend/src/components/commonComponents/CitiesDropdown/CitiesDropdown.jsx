import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { NavDropdown } from 'react-bootstrap';

import { selectedCityChanged } from '../../../store/citiesSlice';
import './CitiesDropdown.css';

export const CitiesDropdown = () => {
  const selectedCity = useSelector((state) => state.cities.selectedCity);
  const allCities = useSelector((state) => state.cities.allCities);
  const dispatch = useDispatch();

  const handleCityChange = (newCity) => {
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

  return (
    <NavDropdown
      title={selectedCity}
      id="basic-nav-dropdown"
      className="cities-dropdowm__txt"
    >
      {navDropdownItems}
    </NavDropdown>
  );
};
