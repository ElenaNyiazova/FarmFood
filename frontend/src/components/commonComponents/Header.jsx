import React, { useState } from 'react';
import { Navbar } from 'react-bootstrap';

import { CitiesDropdown } from './CitiesDropdown';

export const Header = ({ handleLoginClick }) => {
  return (
    <Navbar>
      <Navbar.Brand href="/">LOGO</Navbar.Brand>
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
