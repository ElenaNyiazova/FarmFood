import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

import { ROUTES } from '../../consts/consts';
import { HomePage } from '../pages/HomePage';
import { SellerPage } from '../pages/SellerPage';
import { LoginPage } from '../pages/LoginPage';

export const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route exact path={ROUTES.HOME} element={<HomePage />} />
        <Route exact path={ROUTES.SELLER} element={<SellerPage />} />
        <Route exact path={ROUTES.LOGIN} element={<LoginPage />} />
      </Routes>
    </BrowserRouter>
  );
};
