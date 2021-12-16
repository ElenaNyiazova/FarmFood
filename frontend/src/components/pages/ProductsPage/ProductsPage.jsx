import React from 'react';
import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';

import { ProductCard } from '../../ProductCard/ProductCard';
import { CATEGORIES } from '../../../consts/consts';
import { Search } from '../../Search/Search';
import './ProductPage.css';

export const ProductsPage = () => {
  return (
    <>
      <div className="product-search">
        <span className="products-number">15 products</span>
        <Search />
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
      <Row>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" isSeller />
        </Col>
      </Row>
    </>
  );
};
