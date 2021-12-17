import React from 'react';
import { generatePath, useNavigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { ListGroup } from 'react-bootstrap';

import { selectAllProducts } from '../../store/productsSlice';
import { ROUTES } from '../../consts/consts';
import { CATEGORIES } from '../../consts/consts';

import './CategoriesList.css';

export const CategoriesList = () => {
  const navigate = useNavigate();
  const allProducts = useSelector((state) => selectAllProducts(state));
  const productsCategoriesMap = {};
  for (const value of Object.values(allProducts)) {
    productsCategoriesMap[value.items['01'].product_name] =
      value.product_category;
  }
  // console.log(productsCategoriesMap);
  // console.log(
  //   Object.values(productsCategoriesMap).includes(CATEGORIES.DAIRY_EGGS)
  // );

  const categories = Object.values(CATEGORIES);

  const collapseAll = () => {
    const sublists = document.querySelectorAll('.categories__sublist');
    sublists.forEach((sublist) => {
      sublist.classList.remove('categories__sublist--visible');
    });
    const sliderDisabledBtn = document.querySelector(
      '.carousel-control-prev--disabled'
    );
    if (sliderDisabledBtn) {
      sliderDisabledBtn.classList.remove('carousel-control-prev--disabled');
    }
  };

  const handleCategoryClick = (category, classSuffix, collapsed) => {
    collapseAll();

    if (collapsed) {
      const sublistClassName = `.categories__sublist--${classSuffix}`;
      const sublist = document.querySelector(sublistClassName);
      sublist.classList.add('categories__sublist--visible');

      const sliderPrevBtn = document.querySelector('.carousel-control-prev');
      if (sliderPrevBtn) {
        sliderPrevBtn.classList.add('carousel-control-prev--disabled');
      }
    }
  };

  const handleCategoriesBlur = (e) => {
    collapseAll();
  };

  const handleProductClick = (product) => {
    // console.log(product);
    navigate(generatePath(ROUTES.PRODUCTS, { query: product.toLowerCase() }));
  };

  return (
    <ListGroup className="categories__list" onBlur={handleCategoriesBlur}>
      {categories.map((category) => {
        let classSuffix = category.split(' ')[0].toLowerCase();
        classSuffix = classSuffix === "today's" ? 'deals' : classSuffix;
        category === CATEGORIES.DAIRY_EGGS;
        const collapsed = Object.values(productsCategoriesMap).includes(
          category
        )
          ? 'categories__item--collapsed'
          : '';
        const classes = `categories__item  categories__item--${classSuffix}  ${collapsed}`;

        return (
          <div key={category}>
            <ListGroup.Item
              action
              className={classes}
              key={category}
              onClick={() =>
                handleCategoryClick(category, classSuffix, collapsed)
              }
            >
              {category}
            </ListGroup.Item>
            {collapsed && (
              <ul
                className={`categories__sublist  categories__sublist--${classSuffix}`}
              >
                <h4
                  className={`categories__subheader  categories__subheader--${classSuffix}`}
                  key={'subheader'}
                >
                  {category}
                </h4>
                {Object.entries(productsCategoriesMap).map(([key, value]) => {
                  return value === category ? (
                    <li
                      className="categories__subitem"
                      key={key}
                      onMouseDown={() => handleProductClick(key)}
                    >
                      {key}
                    </li>
                  ) : null;
                })}
              </ul>
            )}
          </div>
        );
      })}
    </ListGroup>
  );
};
