import React, { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Container } from 'react-bootstrap';

import { LocationModal } from '../LocationModal/LocationModal';
import { showLocationModalToggled } from '../../store/citiesSlice';
import { logInToggle } from '../../store/userSlice';
import { LoginModal } from '../LoginModal/LoginModal';
import { Header } from '../commonComponents/Header/Header';

import { ROUTES } from '../../consts/consts';
import { HomePage } from '../pages/HomePage/HomePage';
import { SellerPage } from '../pages/SellerPage/SellerPage';

import { UserProfilePage } from '../pages/UserProfilePage/UserProfilePage';
import { ProfileUpdatePage } from '../pages/ProfileUpdatePage';
import { ProductsPage } from '../pages/ProductsPage/ProductsPage';
import { SearchFailPage } from '../pages/SearchFailPage/SearchFailPage';

import './App.css';
import productsSlice from '../../store/productsSlice';
import { Footer } from '../commonComponents/Footer/Footer';

export const App = () => {
  const showLocationModal = useSelector(
    (state) => state.cities.showLocationModal
  );
  const isLoggedIn = useSelector((state) => state.user.isLoggedIn);
  const loggedInUser = useSelector((state) => state.user.loggedInUser);
  const dispatch = useDispatch();
  const [showLoginForm, setShowLoginForm] = useState(false);

  const handleLoginClick = () => {
    setShowLoginForm(true);
  };
  const handleLogOutClick = () => {
    dispatch(logInToggle());
  };

  const handleCloseLoginForm = () => {
    setShowLoginForm(false);
  };

  const handleLoginSubmit = () => {
    dispatch(logInToggle());
    handleCloseLoginForm();
  };

  const handleCloseLocationModal = () => {
    dispatch(showLocationModalToggled());
  };

  const handleMobCityBlur = () => {
    const citiesCont = document.querySelector('.header__cities-container');
    citiesCont.classList.remove('header__cities-container--visible');
    const searchCont = document.querySelector('.header__search-container');
    searchCont.classList.remove('header__search-container--visible');
    const catalogue = document.querySelector('.header__catalogue-container');
    catalogue.classList.remove('header__catalogue-container--visible');
  };

  return (
    <BrowserRouter>
      <Container fluid className="main_container">
        <LocationModal
          show={showLocationModal}
          handleClose={handleCloseLocationModal}
          handleLogin={handleLoginClick}
        />
        <LoginModal
          show={showLoginForm}
          handleClose={handleCloseLoginForm}
          handleLoginSubmit={handleLoginSubmit}
        />
        <Header
          handleLoginClick={handleLoginClick}
          isLoggedIn={isLoggedIn}
          handleLogOutClick={handleLogOutClick}
          userName={loggedInUser.user_name}
        />
        <Container className="main__middle" onClick={handleMobCityBlur}>
          <Routes>
            <Route exact path={ROUTES.HOME} element={<HomePage />} />
            <Route exact path={ROUTES.SELLER} element={<SellerPage />} />
            <Route exact path={ROUTES.PRODUCTS} element={<ProductsPage />} />
            <Route
              exact
              path={ROUTES.SEARCH_FAIL}
              element={<SearchFailPage />}
            />
            <Route
              exact
              path={ROUTES.PROFILE}
              element={
                isLoggedIn ? (
                  <UserProfilePage handleLogOutClick={handleLogOutClick} />
                ) : (
                  <Navigate to={ROUTES.HOME} />
                )
              }
            />
            <Route
              exact
              path={ROUTES.UPDATE_PROFILE}
              element={<ProfileUpdatePage />}
            />
          </Routes>
        </Container>
        <Footer />
      </Container>
    </BrowserRouter>
  );
};
