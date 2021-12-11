import React, { useState } from "react";
import { useSelector } from "react-redux";

import { Container, Row, Col } from "react-bootstrap";
import SellerCard from "../SellerCard/SellerCard";
import CategoriesList from "../CategoriesList/CategoriesList";
import Search from "../Search/Search";

import { CATEGORIES } from "../../consts/consts";
import { selectSellersIds } from "../../store/sellersSlice";

const HomePage = () => {
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
      <Row>
        <Col xs={8} md={4}>
          <Search handleSearch={handleSearch} />
        </Col>
      </Row>
      <Row>
        <CategoriesList handleCategoryClick={handleCategoryClick} />
        {sellersIds.map((id) => (
          <SellerCard id={id} key={id} filter={filter} />
        ))}
      </Row>
    </Container>
  );
};

export default HomePage;
