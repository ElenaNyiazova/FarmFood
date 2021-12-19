import React from 'react';
import { useSelector } from 'react-redux';

import {
  selectProductsIds,
  selectProductById,
} from '../../../store/productsSlice';

import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';
import { ProductCard } from '../../ProductCard/ProductCard';

import './SearchFailPage.css';

export const SearchFailPage = () => {
  const sellersIds = useSelector((state) => selectProductsIds(state));

  const selectedId = sellersIds[Math.floor(Math.random() * sellersIds.length)];

  const { items } = useSelector((state) =>
    selectProductById(state, selectedId)
  );
  const availableProducts = Object.values(items);
  // console.log(availableProducts);

  const renderedProducts = availableProducts.map((product) => {
    return (
      <Col
        xl="3"
        xs="6"
        className="mt-3"
        key={`${selectedId}-${product.seller_id}`}
      >
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
    <Row>
      <p
        className="searcFail__txt"
        style={{ margin: '0 auto', marginTop: '1.5rem', width: '90%' }}
      >
        Unfortunately, we don't have such a product. But you can choose a{' '}
        {selectedId}!
      </p>
      {renderedProducts}
    </Row>
  );
};
