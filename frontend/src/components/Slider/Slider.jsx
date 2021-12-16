import React from 'react';
import { Carousel } from 'react-bootstrap';

import './Slider.css';
import slide01 from './slide01.png';
import slide02 from './slide02.png';

export const Slider = () => {
  return (
    <Carousel className="slider">
      <Carousel.Item className="slider__item">
        <img
          className="d-block w-100  slider__img"
          src={slide01}
          alt="First slide"
        />
        <Carousel.Caption className="slider__caption">
          <h3 className="slider__header">New fresh vegetables</h3>
          <p className="slider__txt">Really fresh veggies for your meal</p>
          <button onClick={() => console.log('click')} className="slider__btn">
            Go to new products
          </button>
        </Carousel.Caption>
      </Carousel.Item>
      <Carousel.Item className="slider__item">
        <img
          className="d-block w-100  slider__img"
          src={slide02}
          alt="First slide"
        />
        <Carousel.Caption className="slider__caption">
          <h3 className="slider__header  slider__header--white">
            Fresh apples
          </h3>
          <p className="slider__txt  slider__txt--white">
            Nothing compares to the crunch and flavor of a just-picked apple.
          </p>
          <button onClick={() => console.log('click')} className="slider__btn">
            See all apples
          </button>
        </Carousel.Caption>
      </Carousel.Item>
    </Carousel>
  );
};
