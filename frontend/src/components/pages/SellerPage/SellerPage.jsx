import React, { useState } from 'react';
import { useParams } from 'react-router-dom';

import { useSelector } from 'react-redux';
import { selectSellerById } from '../../../store/sellersSlice';
import { selectProductsBySellerId } from '../../../store/productsSlice';
import { Row, Container, Col, Image, Dropdown } from 'react-bootstrap';

import { ProductCard } from '../../ProductCard/ProductCard';
import { CATEGORIES } from '../../../consts/consts';
import { Search } from '../../Search/Search';
import './SellerPage.css';

import star from './star.svg';
import hurt from './seller-follow.svg';
import facebook from './facebook.svg';
import instagram from './instagram.svg';
import viber from './viber.svg';
import whatsup from './whatsup.svg';

export const SellerPage = () => {
  let { id } = useParams();
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  const sellersProducts = useSelector((state) =>
    selectProductsBySellerId(state, id)
  );
  // console.log(sellersProducts);

  const renderedProducts = sellersProducts.map((product) => {
    return (
      <Col
        xl="3"
        className="mt-3"
        key={`${product.product_name}-${product.seller_id}`}
      >
        <ProductCard
          name={product.product_name}
          weight={product.product_weight}
          price={product.product_price}
          image={product.product_image}
          sellerId={product.seller_id}
          isSeller={false}
        />
      </Col>
    );
  });

  const {
    seller_name,
    seller_description,
    seller_contacts: {
      seller_phone,
      seller_site,
      seller_instagram,
      seller_viber,
    },
    seller_grade,
  } = sellerInfo;

  // const [searchResult, setSearchResult] = useState('');
  // const [filter, setFilter] = useState(CATEGORIES.ALL);

  // const handleSearch = (productFromSearch) => {
  //   setFilter(productFromSearch);
  // };

  return (
    <Container className="mt-5">
      <div className="d-flex seller-block">
        <div>
          <Image src={`../images/sellers/seller${id}.png`} />
        </div>
        <div className="ps-4 seller-info">
          <div className="d-flex align-items-center ">
            <div>
              <span className="seller-name">{seller_name}</span>
            </div>
            <div className="d-flex align-items-center ms-4">
              <div>
                <Image src={star} />
              </div>
              <div className="d-flex align-items-center">
                <span className="seller-rating ms-2">{seller_grade}</span>
                <span className="seller-reviews ms-2">(36)</span>
                <span className="seller-reviews-link ms-2">Reviews</span>
              </div>
            </div>
          </div>
          <span className="d-block mt-2 seller-time">
            on FarmFood from June 2020
          </span>

          <div>
            <span className="seller-about mt-4 d-block">About farmer</span>
            <p className="seller-about-text">
              I grow delicious vegetables and fruits in my own beds. Always
              fresh goods. I have been farming for more than 20 years. Product
              weekly updates.
            </p>
          </div>
        </div>
        <div className="d-flex flex-column flex-fill ">
          <button className=" ms-auto justify-self-end d-flex seller-foolow justify-content-center align-items-center">
            <svg
              className="follow-svg"
              width="21"
              height="19"
              viewBox="0 0 21 19"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M2.56309 10.5652C1.51865 9.51155 0.932129 8.0874 0.932129 6.60256C0.932129 5.10948 1.52482 3.67711 2.58058 2.62136C3.63633 1.56561 5.0687 0.9729 6.56178 0.9729C8.05486 0.9729 9.48723 1.56561 10.543 2.62136L10.9278 3.00621L11.3127 2.62136C12.3684 1.56561 13.7998 0.9729 15.2928 0.9729C16.787 0.9729 18.2183 1.56561 19.2741 2.62136C20.3298 3.67711 20.9235 5.10948 20.9235 6.60256C20.9235 8.0874 20.337 9.51155 19.2915 10.5652L11.6543 18.6522C11.466 18.8518 11.2026 18.965 10.9278 18.965C10.6531 18.965 10.3897 18.8518 10.2014 18.6522L2.56309 10.5652ZM10.9278 16.5098L17.8406 9.19049L17.8612 9.16991C18.5414 8.48872 18.9242 7.5657 18.9242 6.60256C18.9242 5.63941 18.5414 4.7164 17.8612 4.03521C17.18 3.35401 16.256 2.97122 15.2928 2.97122C14.3307 2.97122 13.4067 3.35401 12.7255 4.03521L11.6348 5.12697C11.2437 5.51696 10.6109 5.51696 10.2209 5.12697L9.12913 4.03521C8.44896 3.35401 7.52493 2.97122 6.56178 2.97122C5.59864 2.97122 4.67563 3.35401 3.99443 4.03521C3.31323 4.7164 2.93147 5.63941 2.93147 6.60256C2.93147 7.5657 3.31323 8.48872 3.99443 9.16991C4.00163 9.17712 4.00781 9.18329 4.01398 9.19049L10.9278 16.5098Z"
                fill="currentColor"
              />
            </svg>
            <span className="d-block ms-2">Follow</span>
          </button>

          <div className="seller-contacts mt-4">
            <span className="d-block seller-contacts-text">Phone number</span>
            <span className="d-block seller-contacts-number mt-1">
              {seller_phone}
            </span>
          </div>
          <div className="seller-social-media mt-4">
            <span className="d-block">Social media</span>
            <div className="social-media-icon mt-3 d-flex align-items-center">
              <Image className="d-block " src={facebook} />
              <Image className="d-block ms-3" src={viber} />
              <Image className="d-block ms-3" src={instagram} />
              <Image className="d-block ms-3" src={whatsup} />
            </div>
          </div>
        </div>
      </div>
      <div className="seller-search">
        <span className="seller-products-number">15 products</span>
        {/* <Search handleSearch={handleSearch} setSearchResult={setSearchResult} /> */}
        <Dropdown className="seller-dropdown">
          <Dropdown.Toggle
            className="seller-dropdown-button"
            variant="white"
            id="dropdown-basic"
          >
            The cheap first
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item className="seller-dropdown-item" href="#/action-1">
              The cheap first
            </Dropdown.Item>
            <Dropdown.Item className="seller-dropdown-item" href="#/action-2">
              The expensive first
            </Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
      </div>
      <Row>
        {renderedProducts}
        {/* <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" />
        </Col>
        <Col xl="3" className="mt-3">
          <ProductCard name="Apple Gala" weight="1kg" price="2.5" />
        </Col> */}
      </Row>
    </Container>
  );
};
