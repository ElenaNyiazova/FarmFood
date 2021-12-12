import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';

import { Navbar } from 'react-bootstrap';
import { ROUTES } from '../../consts/consts';
import { CitiesDropdown } from './CitiesDropdown';

export const Header = ({ handleLoginClick }) => {
  const navigate = useNavigate();
  const handleLogoClick = () => {
    navigate(generatePath(ROUTES.HOME));
  };

  return (
    <Navbar>
      <Navbar.Brand onClick={handleLogoClick}>LOGO</Navbar.Brand>
      <Navbar.Toggle />
      <Navbar.Collapse className="justify-content-end">
        <CitiesDropdown />
        <Navbar.Text>
          <span
            style={{ textDecoration: 'underline', cursor: 'pointer' }}
            onClick={handleLoginClick}
          >
            Sign In
          </span>
        </Navbar.Text>
      </Navbar.Collapse>
    </Navbar>
  );
};
