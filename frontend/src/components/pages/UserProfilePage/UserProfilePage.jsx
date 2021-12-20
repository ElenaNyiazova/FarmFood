import React, { useState, useMemo } from 'react';
import { useSelector, useDispatch } from 'react-redux';

import { Card as ProfileCard, Col, Row } from 'react-bootstrap';
import { ProfileMenu } from './ProfileMenu';
import { ProfileUpdate } from './ProfileUpdate';
import { ProfileFollow } from './ProfileFollow';
import { ProfileWishlist } from './ProfileWishlist';
import { PROFILE } from '../../../consts/consts';
import './UserProfilePage.css';

export const UserProfilePage = ({ handleLogOutClick }) => {
  const [activeTab, setActiveTab] = useState(PROFILE.PROFILE);

  const handleMenuClick = (menuLink) => {
    setActiveTab(menuLink);
  };
  const favorites = useSelector(
    (state) => state.user.loggedInUser.user_favourite_sellers_ids
  );

  const wishlist = useSelector(
    (state) => state.user.loggedInUser.user_wishlist
  );

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
          <ProfileWishlist productsToRender={wishlist} />
        )}
      </Col>
    </Row>
  );
};
