import React from 'react';
import { useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';

import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';

import { ProductCard } from '../../ProductCard/ProductCard';

import { Search } from '../../Search/Search';
import './ProductPage.css';

import { selectProductById } from '../../../store/productsSlice';

export const ProductsPage = () => {
  let { query } = useParams();
  const { items } = useSelector((state) => selectProductById(state, query));
  const availableProducts = Object.values(items);

  const renderedProducts = availableProducts.map((product) => {
    return (
      <Col xl="3" className="mt-3" key={`${query}-${product.seller_id}`}>
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
    <>
      <div className="product-search">
        <span className="products-number">
          {availableProducts.length} products
        </span>
        {/* <Search /> */}
        <Dropdown className="product-dropdown">
          <Dropdown.Toggle
            className="product-dropdown-button"
            variant="white"
            id="dropdown-basic"
          >
            The cheap first
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item className="product-dropdown-item" href="#/action-1">
              The cheap first
            </Dropdown.Item>
            <Dropdown.Item className="product-dropdown-item" href="#/action-2">
              The expensive first
            </Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
      </div>
      <Row>{renderedProducts}</Row>
    </>
  );
};
