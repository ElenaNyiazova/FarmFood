import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { Card, Col } from 'react-bootstrap';

import { selectSellerById } from '../../store/sellersSlice';
import { handleFavourites } from '../../store/userSlice';
import { CATEGORIES, ROUTES } from '../../consts/consts';

import './SellerCard.css';

export const SellerCard = ({ id, filter }) => {
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  const dispatch = useDispatch();
  const favorites = useSelector(
    (state) => state.user.loggedInUser.user_favourite_sellers_ids
  );
  const isLoggedIn = useSelector((state) => state.user.isLoggedIn);

  const isInFavourites = isLoggedIn && favorites.includes(id);
  const { seller_name, seller_categories, seller_products, seller_grade } =
    sellerInfo;

  const isVisible =
    filter === CATEGORIES.ALL
      ? true
      : seller_categories.includes(filter) ||
        seller_products.filter((product) => product.includes(filter)).length >
          0;

  const navigate = useNavigate();
  const handleCardClick = (e) => {
    if (e.target.classList.contains('sellerCard__follow')) {
      return;
    }

    navigate(
      generatePath(ROUTES.SELLER, {
        id,
      })
    );
  };

  const handleFollowClick = (e) => {
    if (isLoggedIn) {
      dispatch(handleFavourites(id));
    }
  };

  return (
    isVisible && (
      <Col xl="4" md="6" xs="6" className="sellerCard__wrapper">
        <Card bg="light" className="sellerCard" onClick={handleCardClick}>
          <Card.Body className="sellerCard__body">
            <img
              src={`./images/sellers/seller${id}.png`}
              className="sellerCard__img"
            />
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
              <span className="sellerCard__rating">
                {seller_grade} <span className="sellerCard_review">(15)</span>
              </span>
              <button
                className="sellerCard__follow"
                onMouseDown={(e) => handleFollowClick(e)}
              >
                {isInFavourites ? 'Unfollow' : 'Follow'}
              </button>
            </div>
          </Card.Body>
        </Card>
      </Col>
    )
  );
};
