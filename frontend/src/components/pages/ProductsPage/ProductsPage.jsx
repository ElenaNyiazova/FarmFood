import React, { useState } from 'react';
import { useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';

import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';

import { ProductCard } from '../../ProductCard/ProductCard';
import { SortingDropdown } from '../../commonComponents/SortingDropdown/SortingDropdown';

import './ProductPage.css';

import { selectProductById } from '../../../store/productsSlice';

export const ProductsPage = () => {
  let { query } = useParams();
  const { items } = useSelector((state) => selectProductById(state, query));
  const availableProducts = Object.values(items);
  // const productsToRender = availableProducts;
  const [productsToRender, setProductsToRender] = useState(availableProducts);

  const renderedProducts = productsToRender.map((product) => {
    return (
      <Col xl="3" md="4" xs="6" key={`${query}-${product.seller_id}`}>
        <ProductCard
          name={product.product_name}
          weight={product.product_weight}
          price={product.product_price}
          image={product.product_image}
          sellerId={product.seller_id}
          isSeller
        />
      </Col>
    );
  });

  return (
    <Container className="products__container">
      <div className="product-search-container">
        <span className="products-number">
          {productsToRender.length} products
        </span>
        <SortingDropdown productsArray={productsToRender} />
      </div>
      <Row className="products-cards">{renderedProducts}</Row>
    </Container>
  );
};
