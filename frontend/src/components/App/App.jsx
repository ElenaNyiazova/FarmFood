import React, { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { Container } from 'react-bootstrap';

import { LocationModal } from '../LocationModal/LocationModal';
import { showLocationModalToggled } from '../../store/citiesSlice';
import { LoginModal } from '../LoginModal/LoginModal';
import { Header } from '../commonComponents/Header';

import { ROUTES } from '../../consts/consts';
import { HomePage } from '../pages/HomePage';
import { SellerPage } from '../pages/SellerPage';

export const App = () => {
  const showLocationModal = useSelector(
    (state) => state.cities.showLocationModal
  );
  const dispatch = useDispatch();
  const [showLoginForm, setShowLoginForm] = useState(false);

  const handleLoginClick = () => {
    console.log('login clicked');
    setShowLoginForm(true);
    console.log(showLoginForm);
  };

  const handleCloseLoginForm = () => {
    setShowLoginForm(false);
  };

  const handleCloseLocationModal = () => {
    dispatch(showLocationModalToggled());
  };

  return (
    <Container fluid>
      <LocationModal
        show={showLocationModal}
        handleClose={handleCloseLocationModal}
      />
      <LoginModal show={showLoginForm} handleClose={handleCloseLoginForm} />
      <Header handleLoginClick={handleLoginClick} />
      <BrowserRouter>
        <Routes>
          <Route exact path={ROUTES.HOME} element={<HomePage />} />
          <Route exact path={ROUTES.SELLER} element={<SellerPage />} />
        </Routes>
      </BrowserRouter>
    </Container>
  );
};
