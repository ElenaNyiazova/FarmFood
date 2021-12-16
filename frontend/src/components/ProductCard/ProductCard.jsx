import React from 'react';
import { Card, Image } from 'react-bootstrap';

import like from './like.svg';
import './ProductCard.css';
import star from './star.svg';

export const ProductCard = ({ name, price, weight, isSeller }) => {
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
        {isSeller ? (
          <div className="d-flex justify-content-between align-items-center mt-4">
            <div className="product-seller">
              <span className="d-block product-seller-name">Ivan Polonsky</span>
              <span className="d-block product-seller-time">
                on FarmFood from June 2020
              </span>
            </div>
            <Image src="https://via.placeholder.com/64X64" roundedCircle />
          </div>
        ) : null}
        {isSeller ? (
          <div className="d-flex align-items-center mt-4">
            <span className="d-block seller-link">All seller's products</span>
            <div className="d-flex align-items-center">
              <div>
                <Image className="d-block" src={star} />
              </div>
              <div>
                <span className="seller-rating fw-bold ms-2">4.7</span>
                <span className="seller-reviews ms-2">(36)</span>
              </div>
            </div>
          </div>
        ) : null}
      </Card.Body>
    </Card>
  );
};
