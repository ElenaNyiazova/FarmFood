import React, { useState } from 'react';
import { useSelector } from 'react-redux';

import { Container, Row, Col } from 'react-bootstrap';
import { Header } from '../commonComponents/Header';
import { SellerCard } from '../SellerCard/SellerCard';
import { CategoriesList } from '../CategoriesList/CategoriesList';
import { Search } from '../Search/Search';
import { LocationModal } from '../LocationModal/LocationModal';

import { CATEGORIES } from '../../consts/consts';
import { selectSellersIds } from '../../store/sellersSlice';

export const HomePage = () => {
  const [filter, setFilter] = useState(CATEGORIES.ALL);
  const sellersIds = useSelector((state) => selectSellersIds(state));

  const handleCategoryClick = (category) => {
    setFilter(category);
  };

  const handleSearch = (productFromSearch) => {
    setFilter(productFromSearch);
  };

  return (
    <Container fluid>
      <LocationModal />
      <Header />
      <Row>
        <Col xs={8} md={4}>
          <Search handleSearch={handleSearch} />
        </Col>
      </Row>
      <Row style={{ paddingLeft: '0.8rem' }}>
        <CategoriesList handleCategoryClick={handleCategoryClick} />
        {sellersIds.map((id) => (
          <SellerCard id={id} key={id} filter={filter} />
        ))}
      </Row>
    </Container>
  );
};
