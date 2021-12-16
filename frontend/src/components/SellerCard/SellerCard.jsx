import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { Card } from 'react-bootstrap';

import { selectSellerById } from '../../store/sellersSlice';
import { CATEGORIES, ROUTES } from '../../consts/consts';

import './SellerCard.css';
import seller01 from './seller01.png';

export const SellerCard = ({ id, filter }) => {
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  const { seller_name, seller_categories, seller_products } = sellerInfo;

  const isVisible =
    filter === CATEGORIES.ALL
      ? true
      : seller_categories.includes(filter) ||
        seller_products.filter((product) => product.includes(filter)).length >
          0;

  const navigate = useNavigate();
  const handleCardClick = () => {
    navigate(
      generatePath(ROUTES.SELLER, {
        id,
      })
    );
  };

  return (
    isVisible && (
      <Card bg="light" className="sellerCard" onClick={handleCardClick}>
        <Card.Body className="sellerCard__body">
          <img src={seller01} className="sellerCard__img" />
          <Card.Title className="sellerCard__name">{seller_name}</Card.Title>
          <ul className="sellerCard__categories">
            {seller_categories.map((category) => {
              return (
                <li key={category} className="sellerCard__category">
                  {category}
                </li>
              );
            })}
          </ul>
          <div className="sellerCard__bottom">
            <span className="sellerCard__rating">4.8 (15)</span>
            <button className="sellerCard__follow">Follow</button>
          </div>
        </Card.Body>
      </Card>
    )
  );
};
