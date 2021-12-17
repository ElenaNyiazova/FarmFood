import React, { useState } from 'react';
import { useSelector } from 'react-redux';

import { Row, Col } from 'react-bootstrap';
import { SellerCard } from '../../SellerCard/SellerCard';
import { CategoriesList } from '../../CategoriesList/CategoriesList';
import { Slider } from '../../Slider/Slider';
import { selectSellersIds } from '../../../store/sellersSlice';

import './HomePage.css';

export const HomePage = () => {
  const sellersIds = useSelector((state) => selectSellersIds(state));

  return (
    <Row xs={2} lg={12} className="home__container">
      <Col lg={3} className="home__left">
        <CategoriesList />
      </Col>
      <Col lg={9} className="home__right">
        <Slider />
        <h2 className="home__subheader">Local farmers</h2>
        <div className="home__gallery">
          {sellersIds.map((id) => (
            <SellerCard id={id} key={id} />
          ))}
        </div>
      </Col>
    </Row>
  );
};
