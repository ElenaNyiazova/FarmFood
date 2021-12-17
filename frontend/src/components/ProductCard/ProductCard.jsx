import React from 'react';
import { useSelector } from 'react-redux';
import { generatePath, useNavigate } from 'react-router-dom';

import { Card, Image } from 'react-bootstrap';
import { selectSellerById } from '../../store/sellersSlice';
import { ROUTES } from '../../consts/consts';

import like from './like.svg';
import './ProductCard.css';
import star from './star.svg';

export const ProductCard = ({
  name,
  price,
  weight,
  isSeller,
  image,
  sellerId,
}) => {
  const sellerInfo = useSelector((state) => selectSellerById(state, sellerId));
  const { seller_name, seller_grade } = sellerInfo;
  const navigate = useNavigate();

  const handleSellerClick = () => {
    navigate(
      generatePath(ROUTES.SELLER, {
        id: sellerId,
      })
    );
  };

  return (
    <Card className="rounded-3 product-card">
      <Card.Body>
        <Card.Img
          variant="top"
          src={`../images/products/${image}`}
          width="282"
          height="auto"
        />
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
              <span className="d-block product-seller-name">{seller_name}</span>
              <span className="d-block product-seller-time">
                on FarmFood from June 2020
              </span>
            </div>
            <div className="product-seller-image">
              <Image
                src={`../images/sellers/seller${sellerId}.png`}
                width="auto"
                height="64"
              />
            </div>
          </div>
        ) : null}
        {isSeller ? (
          <div className="d-flex align-items-center mt-4">
            <a className="d-block seller-link" onClick={handleSellerClick}>
              All seller's products
            </a>
            <div className="d-flex align-items-center">
              <div>
                <Image className="d-block" src={star} />
              </div>
              <div>
                <span className="seller-rating fw-bold ms-2">
                  {seller_grade}
                </span>
                <span className="seller-reviews ms-2">(36)</span>
              </div>
            </div>
          </div>
        ) : null}
      </Card.Body>
    </Card>
  );
};
