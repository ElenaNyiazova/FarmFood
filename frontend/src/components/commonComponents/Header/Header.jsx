import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';

import { Container, Navbar } from 'react-bootstrap';
import { ROUTES } from '../../../consts/consts';
import { CitiesDropdown } from '../CitiesDropdown/CitiesDropdown';
import { Search } from '../../Search/Search';

import './Header.css';
import logo from './farm-food_logo.svg';

export const Header = ({
  handleLoginClick,
  isLoggedIn,
  handleLogOutClick,
  userName,
}) => {
  const navigate = useNavigate();
  const handleLogoClick = () => {
    navigate(generatePath(ROUTES.HOME));
  };
  const handleUsernameClick = () => {
    navigate(generatePath(ROUTES.PROFILE));
  };
  const handleSearch = (productFromSearch) => {
    console.log(productFromSearch);
    navigate(generatePath(ROUTES.PRODUCTS, { query: productFromSearch }));
  };

  return (
    <Container fluid className="header">
      <Container>
        <Navbar className="header__navbar">
          <Navbar.Brand onClick={handleLogoClick}>
            <img src={logo} alt="Logo" className="header__logo" />;
          </Navbar.Brand>
          <Navbar.Toggle />
          <Navbar.Collapse className="justify-content-end  header__navbar-collapse">
            <Search handleSearch={handleSearch} />
            <Navbar.Text>
              {!isLoggedIn && (
                <span
                  className="header__txt  header__txt--profile"
                  onClick={handleLoginClick}
                >
                  Sign In
                </span>
              )}
              {isLoggedIn && (
                <>
                  <span className="header__txt" style={{ marginRight: '1rem' }}>
                    Signed in as
                  </span>
                  <span
                    className="header__txt  header__txt--profile"
                    onClick={handleUsernameClick}
                  >
                    {userName}
                  </span>
                  <span className="header__txt" onClick={handleLogOutClick}>
                    Sign Out
                  </span>
                </>
              )}
            </Navbar.Text>
            <CitiesDropdown theme={null} />
          </Navbar.Collapse>
        </Navbar>
      </Container>
    </Container>
  );
};
