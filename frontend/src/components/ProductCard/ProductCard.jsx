import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { generatePath, useNavigate } from 'react-router-dom';

import { Card, Image } from 'react-bootstrap';
import { selectSellerById } from '../../store/sellersSlice';
import { handleFavouriteProducts } from '../../store/userSlice';
import { ROUTES } from '../../consts/consts';

import like from './like.svg';
import dislike from './dislike.svg';
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
  const isLoggedIn = useSelector((state) => state.user.isLoggedIn);
  const dispatch = useDispatch();

  const wishlist = useSelector(
    (state) => state.user.loggedInUser.user_wishlist
  );
  const filteredWishList = wishlist.filter(
    (item) => item.product_name + item.seller_id === name + sellerId
  );
  const isInWishlist = isLoggedIn && filteredWishList.length > 0;
  const { seller_name, seller_grade } = sellerInfo;
  const navigate = useNavigate();

  const handleSellerClick = () => {
    navigate(
      generatePath(ROUTES.SELLER, {
        id: sellerId,
      })
    );
  };

  const handleProductFavClick = () => {
    if (isLoggedIn) {
      dispatch(
        handleFavouriteProducts({
          product_name: name,
          seller_id: sellerId,
          product_weight: weight,
          product_price: price,
          product_image: image,
        })
      );
    }
  };

  return (
    <Card className="product-card">
      <Card.Body>
        <Card.Img
          variant="top"
          src={`../images/products/${image}`}
          width="282"
          height="auto"
        />
        <div className="d-flex justify-content-between mt-3 align-items-center">
          <Card.Text className="mb-0 product-name">{name}</Card.Text>
          <div onMouseDown={handleProductFavClick}>
            {isInWishlist ? (
              <Card.Img
                src={dislike}
                className="product-favourite-btn"
              ></Card.Img>
            ) : (
              <Card.Img src={like} className="product-favourite-btn"></Card.Img>
            )}
          </div>
        </div>
        <div className="d-flex align-items-center mt-4  product-price-weight-container">
          <Card.Text className="m-0 product-price"> {price} $ </Card.Text>
          <Card.Text className="ms-3 product-weight"> per {weight} </Card.Text>
        </div>
        {isSeller ? (
          <div className="d-flex justify-content-between align-items-center mt-4 seller-name-img-container">
            <div className="product-seller" onClick={handleSellerClick}>
              <span className="d-block product-seller-name">{seller_name}</span>
              <span
                className="d-block product-seller-time"
                id="product-seller-time"
              >
                on FarmFood from June 2020
              </span>
            </div>
            <div className="product-seller-image" onClick={handleSellerClick}>
              <Image
                src={`../images/sellers/seller${sellerId}.png`}
                width="auto"
                height="64"
              />
            </div>
          </div>
        ) : null}
        {isSeller ? (
          <div className="product-seller-bottom">
            <a className="product-seller-link" onClick={handleSellerClick}>
              All seller's products
            </a>
            <div className="product-seller-rating-container">
              <div>
                <Image className="d-block" src={star} />
              </div>
              <div>
                <span className="product-seller-rating fw-bold ms-2">
                  {seller_grade}
                </span>
                <span className="product-seller-reviews ms-2">(36)</span>
              </div>
            </div>
          </div>
        ) : null}
      </Card.Body>
    </Card>
  );
};
