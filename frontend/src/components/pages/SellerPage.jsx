import React from 'react';
import { useParams } from 'react-router-dom';

import { useSelector } from 'react-redux';
import { selectSellerById } from '../../store/sellersSlice';
import { selectProductsBySellerId } from '../../store/productsSlice';
import { Container, Card, Row } from 'react-bootstrap';
import { Header } from '../commonComponents/Header';

export const SellerPage = () => {
  let { id } = useParams();
  console.log(id);
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  const sellersProducts = useSelector((state) =>
    selectProductsBySellerId(state, id)
  );
  const {
    seller_name,
    seller_description,
    seller_buy_methods,
    seller_contacts: {
      seller_phone,
      seller_site,
      seller_instagram,
      seller_viber,
    },
    seller_products,
  } = sellerInfo;
  console.log(sellerInfo);
  console.log(sellersProducts);
  return (
    <Container fluid>
      <Header />

      <Card>
        <Card.Body>
          <Card.Title className="text-center">{seller_name}</Card.Title>
          <Card.Text>{seller_description}</Card.Text>
        </Card.Body>
        <Card.Footer className="text-center">
          <Card.Text>Our contacts</Card.Text>
          <Card.Text>{`phone: ${seller_phone}`}</Card.Text>
          <Card.Text>{`site: ${seller_site}`}</Card.Text>
          <Card.Text>{`instagram: ${seller_instagram}`}</Card.Text>
          <Card.Text>{`viber: ${seller_viber}`}</Card.Text>
        </Card.Footer>
      </Card>
      <Row className="mt-3">
        {sellersProducts.map((item) => {
          return (
            <Card
              bg="light"
              key={item.product_name}
              style={{
                width: '18rem',
                marginRight: '1rem',
                marginBottom: '1rem',
              }}
            >
              <Card.Body>
                <Card.Text>{item.product_name}</Card.Text>
                <Card.Text>{item.product_price}</Card.Text>
                <Card.Text>{item.product_weight}</Card.Text>
              </Card.Body>
            </Card>
          );
        })}
      </Row>
    </Container>
  );
};
