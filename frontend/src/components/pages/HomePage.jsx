import React, { useState } from 'react';
import { useSelector } from 'react-redux';

import { Row, Col } from 'react-bootstrap';
import { SellerCard } from '../SellerCard/SellerCard';
import { CategoriesList } from '../CategoriesList/CategoriesList';
import { Search } from '../Search/Search';

import { CATEGORIES } from '../../consts/consts';
import { selectSellersIds } from '../../store/sellersSlice';

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
      <Row>
        <Col xs={8} md={4}>
          <Search
            handleSearch={handleSearch}
            setSearchResult={setSearchResult}
          />
          {searchResult && <p>Search results for {searchResult}</p>}
        </Col>
      </Row>
      <Row style={{ paddingLeft: '0.8rem' }}>
        <CategoriesList handleCategoryClick={handleCategoryClick} />
        {sellersIds.map((id) => (
          <SellerCard id={id} key={id} filter={filter} />
        ))}
      </Row>
    </>
  );
};
