import React from 'react';
import { Row, Col } from 'react-bootstrap';
import { SellerCard } from '../../SellerCard/SellerCard';

export const ProfileFollow = ({ favorites }) => {
  return (
    <Row>
      {favorites.map((id) => (
        <SellerCard id={id} key={id} />
      ))}
    </Row>
  );
};
