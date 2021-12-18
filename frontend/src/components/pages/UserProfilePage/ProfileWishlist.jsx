import React from 'react';
import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';
import { ProductCard } from '../../ProductCard/ProductCard';

export const ProfileWishlist = ({ productsToRender }) => {
  const renderedProducts = productsToRender.map((product) => {
    return (
      <Col xl="4" key={`profile-${product.product_name}-${product.seller_id}`}>
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

  return <Row>{renderedProducts}</Row>;
};
