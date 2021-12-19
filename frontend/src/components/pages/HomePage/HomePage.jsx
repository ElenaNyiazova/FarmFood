import React, { useState } from 'react';
import { useSelector } from 'react-redux';

import { Row, Col, Container } from 'react-bootstrap';
import { SellerCard } from '../../SellerCard/SellerCard';
import { CategoriesList } from '../../CategoriesList/CategoriesList';
import { Slider } from '../../Slider/Slider';
import { selectSellersIds } from '../../../store/sellersSlice';

import './HomePage.css';

export const HomePage = () => {
  const sellersIds = useSelector((state) => selectSellersIds(state));

  return (
    <Row className="home__container">
      <Col lg={3} md="3" xs="12" className="home__left">
        <CategoriesList />
      </Col>
      <Col lg={9} md="9" xs="12" className="home__right">
        <Slider />
        <h2 className="home__subheader">Local farmers</h2>
        <Row className="home__gallery">
          {sellersIds.map((id) => (
            <SellerCard id={id} key={id} />
          ))}
        </Row>
      </Col>
    </Row>
  );
};
