import React, { useState } from 'react';
import { Modal } from 'react-bootstrap';
import { CitiesDropdown } from '../commonComponents/CitiesDropdown/CitiesDropdown';

import './LocationModal.css';

export const LocationModal = ({ show, handleClose, handleLogin }) => {
  const handleLoginClick = () => {
    handleClose();
    handleLogin();
  };

  return (
    <>
      <Modal
        className="location__container"
        show={show}
        onHide={handleClose}
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Body className="location__modal-body">
          <span className="location__txt">Choose your location</span>
          <CitiesDropdown theme="dark" />
          <button className="location__btn" onClick={handleClose}>
            OK
          </button>
          <span className="location__txt">
            Already registered?{' '}
            <a className="location__link" onClick={handleLoginClick}>
              Log in
            </a>
          </span>
        </Modal.Body>
      </Modal>
    </>
  );
};
