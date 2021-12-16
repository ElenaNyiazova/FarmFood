import React, { useState } from 'react';
import { useSelector } from 'react-redux';

import { Row, Col, Carousel } from 'react-bootstrap';
import { SellerCard } from '../../SellerCard/SellerCard';
import { CategoriesList } from '../../CategoriesList/CategoriesList';
import { Search } from '../../Search/Search';
import { Slider } from '../../Slider/Slider';

import { CATEGORIES } from '../../../consts/consts';
import { selectSellersIds } from '../../../store/sellersSlice';

import './HomePage.css';

export const HomePage = () => {
  const [filter, setFilter] = useState(CATEGORIES.ALL);
  const sellersIds = useSelector((state) => selectSellersIds(state));
  const [searchResult, setSearchResult] = useState('');

  const handleCategoryClick = (category) => {
    setFilter(category);
    setSearchResult('');
  };

  const handleSearch = (productFromSearch) => {
    setFilter(productFromSearch);
  };

  return (
    <>
      {/* <Row>
        <Col xs={8} md={4}>
          <Search
            handleSearch={handleSearch}
            setSearchResult={setSearchResult}
          />
          {searchResult && <p>Search results for {searchResult}</p>}
        </Col>
      </Row> */}
      <Row xs={2} md={4} lg={12} className="home__container">
        <Col lg={3} className="home__left">
          <CategoriesList handleCategoryClick={handleCategoryClick} />
        </Col>
        <Col lg={9} className="home__right">
          <Slider />
          <h2 className="home__subheader">Local farmers</h2>
          <div className="home__gallery">
            {sellersIds.map((id) => (
              <SellerCard id={id} key={id} filter={filter} />
            ))}
          </div>
        </Col>
      </Row>
    </>
  );
};
