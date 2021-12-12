import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';

import { Navbar } from 'react-bootstrap';
import { ROUTES } from '../../consts/consts';
import { CitiesDropdown } from './CitiesDropdown';

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

  return (
    <Navbar>
      <Navbar.Brand style={{ cursor: 'pointer' }} onClick={handleLogoClick}>
        LOGO
      </Navbar.Brand>
      <Navbar.Toggle />
      <Navbar.Collapse className="justify-content-end">
        <CitiesDropdown />
        <Navbar.Text>
          {!isLoggedIn && (
            <span
              style={{ textDecoration: 'underline', cursor: 'pointer' }}
              onClick={handleLoginClick}
            >
              Sign In
            </span>
          )}
          {isLoggedIn && (
            <>
              <span style={{ marginRight: '0.3rem' }}>Signed in as</span>
              <span
                style={{
                  textDecoration: 'underline',
                  cursor: 'pointer',
                  marginRight: '1rem',
                }}
                onClick={handleUsernameClick}
              >
                {userName}
              </span>
              <span
                style={{ textDecoration: 'underline', cursor: 'pointer' }}
                onClick={handleLogOutClick}
              >
                Sign Out
              </span>
            </>
          )}
        </Navbar.Text>
      </Navbar.Collapse>
    </Navbar>
  );
};
