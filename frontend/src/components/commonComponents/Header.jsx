import React, { useState } from 'react';
import { Navbar } from 'react-bootstrap';

import { CitiesDropdown } from './CitiesDropdown';

export const Header = () => {
  return (
    <Navbar>
      <Navbar.Brand href="/">LOGO</Navbar.Brand>
      <Navbar.Toggle />
      <Navbar.Collapse className="justify-content-end">
        <CitiesDropdown />
        <Navbar.Text>
          <a href="/login">Sign In</a>
        </Navbar.Text>
      </Navbar.Collapse>
    </Navbar>
  );
};
