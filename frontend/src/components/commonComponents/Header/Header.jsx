import React from 'react';
import { useSelector } from 'react-redux';

import { generatePath, useNavigate } from 'react-router-dom';

import { Container, Navbar } from 'react-bootstrap';
import { ROUTES } from '../../../consts/consts';
import { CitiesDropdown } from '../CitiesDropdown/CitiesDropdown';
import { Search } from '../../commonComponents/Search/Search';
import { selectProductsIds } from '../../../store/productsSlice';

import './Header.css';
import logo from './farm-food_logo.svg';
import { CategoriesList } from '../../CategoriesList/CategoriesList';
import { CategoriesAccordion } from '../../CategoriesList/CategoriesAccordion';

export const Header = ({
  handleLoginClick,
  isLoggedIn,
  handleLogOutClick,
  userName,
}) => {
  const productIds = useSelector((state) => selectProductsIds(state));
  const navigate = useNavigate();
  const handleLogoClick = () => {
    navigate(generatePath(ROUTES.HOME));
  };
  const handleUsernameClick = () => {
    // console.log('click');
    navigate(generatePath(ROUTES.PROFILE));
  };
  const handleSearch = (productFromSearch) => {
    const isInProducts = productIds.filter(
      (item) => item === productFromSearch
    );
    if (isInProducts.length > 0) {
      navigate(generatePath(ROUTES.PRODUCTS, { query: productFromSearch }));
    } else {
      navigate(generatePath(ROUTES.SEARCH_FAIL));
    }
  };

  const handleMobSearch = () => {
    const searchCont = document.querySelector('.header__search-container');
    searchCont.classList.add('header__search-container--visible');
  };
  const handleCityMobClick = () => {
    const citiesCont = document.querySelector('.header__cities-container');
    citiesCont.classList.add('header__cities-container--visible');
  };

  const handleCatalogueIconClick = () => {
    const catalogue = document.querySelector('.header__catalogue-container');
    catalogue.classList.add('header__catalogue-container--visible');
  };

  return (
    <Container fluid className="header">
      <Container>
        <Navbar className="header__navbar">
          <div
            className="header__catalogue-icon"
            onClick={handleCatalogueIconClick}
          ></div>
          <div className="header__catalogue-container">
            <CategoriesAccordion />
          </div>

          <Navbar.Brand onClick={handleLogoClick}>
            <img src={logo} alt="Logo" className="header__logo" />
          </Navbar.Brand>
          <div className="header__navbar-collapse">
            <div
              className="header__search-icon"
              onClick={handleMobSearch}
            ></div>
            <Search handleSearch={handleSearch} suggestionsArray={productIds} />
            <div className="header__search-container  ">
              <Search
                handleSearch={handleSearch}
                suggestionsArray={productIds}
              />
            </div>
            <Navbar.Text>
              {!isLoggedIn && (
                <>
                  <div
                    className="header__login-icon"
                    onClick={handleLoginClick}
                  ></div>
                  <span
                    className="header__txt  header__txt--profile"
                    onClick={handleLoginClick}
                  >
                    Sign In
                  </span>
                </>
              )}
              {isLoggedIn && (
                <>
                  <div
                    className="header__login-icon  header__login-icon--in"
                    onClick={handleUsernameClick}
                  ></div>
                  <div className="header__signedin">
                    <span
                      className="header__txt  header__txt--profile"
                      onClick={handleUsernameClick}
                    >
                      {userName}
                    </span>
                    <span className="header__txt" onClick={handleLogOutClick}>
                      Sign Out
                    </span>
                  </div>
                </>
              )}
            </Navbar.Text>
            <div
              className="header__cities-icon"
              onClick={handleCityMobClick}
            ></div>
            <div className="header__cities-container">
              <CitiesDropdown theme={null} />
            </div>
          </div>
        </Navbar>
      </Container>
    </Container>
  );
};
