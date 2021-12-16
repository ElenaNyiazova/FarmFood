import React, { useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Container } from 'react-bootstrap';

import { LocationModal } from '../LocationModal/LocationModal';
import { showLocationModalToggled } from '../../store/citiesSlice';
import { logInToggle } from '../../store/userSlice';
import { LoginModal } from '../LoginModal/LoginModal';
import { Header } from '../commonComponents/Header';

import { ROUTES } from '../../consts/consts';
import { HomePage } from '../pages/HomePage';
import { SellerPage } from '../pages/SellerPage/SellerPage';
import { UserProfilePage } from '../pages/UserProfilePage';
import { ProfileUpdatePage } from '../pages/ProfileUpdatePage';

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

  return (
    <BrowserRouter>
      <Container fluid>
        <LocationModal
          show={showLocationModal}
          handleClose={handleCloseLocationModal}
        />
        <LoginModal
          show={showLoginForm}
          handleClose={handleCloseLoginForm}
          handleSubmit={handleLoginSubmit}
        />
        <Header
          handleLoginClick={handleLoginClick}
          isLoggedIn={isLoggedIn}
          handleLogOutClick={handleLogOutClick}
          userName={loggedInUser.user_name}
        />
        <Routes>
          <Route exact path={ROUTES.HOME} element={<HomePage />} />
          <Route exact path={ROUTES.SELLER} element={<SellerPage />} />
          <Route
            exact
            path={ROUTES.PROFILE}
            element={
              isLoggedIn ? <UserProfilePage /> : <Navigate to={ROUTES.HOME} />
            }
          />
          <Route
            exact
            path={ROUTES.UPDATE_PROFILE}
            element={<ProfileUpdatePage />}
          />
        </Routes>
      </Container>
    </BrowserRouter>
  );
};
