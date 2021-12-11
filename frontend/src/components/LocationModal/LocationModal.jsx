import React, { useState } from 'react';
import { Modal } from 'react-bootstrap';
import { CitiesDropdown } from '../commonComponents/CitiesDropdown';

export const LocationModal = () => {
  const [show, setShow] = useState(true);

  const handleClose = () => setShow(false);

  return (
    <>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Welcome to Farm Food!</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          You can find all the eco food sellers available in selected region.
          Please select your location:
          <CitiesDropdown />
        </Modal.Body>
        <Modal.Footer style={{ justifyContent: 'flex-start' }}>
          You can change it in the top right corner of the page at any time
        </Modal.Footer>
      </Modal>
    </>
  );
};
