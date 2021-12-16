import React from 'react';
import { Card } from 'react-bootstrap';

import like from './like.svg';
import './ProductCard.css';

export const ProductCard = ({ name, price, weight }) => {
  return (
    <Card className="rounded-3 product-card">
      <Card.Body>
        <Card.Img variant="top" src="https://via.placeholder.com/282x208" />
        <div className="d-flex justify-content-between mt-3 align-items-center">
          <Card.Text className="mb-0 product-name">{name}</Card.Text>
          <div>
            <Card.Img src={like}></Card.Img>
          </div>
        </div>
        <div className="d-flex align-items-center mt-4">
          <Card.Text className="m-0 product-price"> {price} $ </Card.Text>
          <Card.Text className="ms-3 product-weight"> per {weight} </Card.Text>
        </div>
      </Card.Body>
    </Card>
  );
};
