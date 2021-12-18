import React, { useState, useMemo } from 'react';
import {
  Card as ProfileCard,
  Container,
  Image,
  Col,
  Row,
} from 'react-bootstrap';
import { ProfileMenu } from './ProfileMenu';
import { ProfileUpdate } from './ProfileUpdate';
import { ProfileFollow } from './ProfileFollow';
import { ProfileWishlist } from './ProfileWishlist';
import { Link } from 'react-router-dom';
import { ROUTES, PROFILE } from '../../../consts/consts';
import './UserProfilePage.css';

export const UserProfilePage = ({ handleLogOutClick }) => {
  const [activeTab, setActiveTab] = useState(PROFILE.PROFILE);

  const handleMenuClick = (menuLink) => {
    setActiveTab(menuLink);
  };

  const favorites = ['01', '02', '03', '04', '05', '06', '07'];
  const widhlist = [
    {
      product_name: 'chicken eggs',
      seller_id: '01',
      product_weight: '10 pcs',
      product_price: '2.5',
      product_image: 'chicken_eggs.jpg',
    },
    {
      product_name: 'milk',
      seller_id: '01',
      product_weight: '1 liter',
      product_price: '2.5',
      product_image: 'milk1.jpg',
    },
    {
      product_name: 'curd',
      seller_id: '01',
      product_weight: '1 kg',
      product_price: '4.5',
      product_image: 'curd1.jpg',
    },
    {
      product_image: 'curd3.jpg',
      product_name: 'curd',
      product_price: '4.8',
      product_weight: '1 kg',
      seller_id: '03',
    },
    {
      product_image: 'chicken_eggs4.jpg',
      product_name: 'chicken eggs',
      product_price: '2.2',
      product_weight: '10 pcs',
      seller_id: '04',
    },
  ];

  // const user = {};
  // const user = auth.currentUser;
  // const { data } = useEntities();

  // const favorites = useMemo(() => data?.filter(({ isFavorite }) => isFavorite), [data]);

  return (
    <Row className="profile__container">
      <Col lg={3} className="profile__left">
        <ProfileMenu
          handleClick={handleMenuClick}
          handleLogOutClick={handleLogOutClick}
        />
      </Col>
      <Col lg={9} className="profile__right">
        {activeTab === PROFILE.PROFILE && <ProfileUpdate />}
        {activeTab === PROFILE.FOLLOW && (
          <ProfileFollow favorites={favorites} />
        )}
        {activeTab === PROFILE.WIHSLIST && (
          <ProfileWishlist productsToRender={widhlist} />
        )}
      </Col>
    </Row>
  );
};
