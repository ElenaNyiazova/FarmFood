import React from 'react';
import { generatePath, useNavigate, useParams } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { ListGroup, Accordion } from 'react-bootstrap';

import { selectAllProducts } from '../../store/productsSlice';
import { ROUTES } from '../../consts/consts';
import { CATEGORIES } from '../../consts/consts';

import './CategoriesAccordion.css';

export const CategoriesAccordion = () => {
  const navigate = useNavigate();
  const allProducts = useSelector((state) => selectAllProducts(state));
  const productsCategoriesMap = {};
  for (const value of Object.values(allProducts)) {
    productsCategoriesMap[value.items['01'].product_name] =
      value.product_category;
  }

  const categories = Object.values(CATEGORIES);

  const collapseAll = () => {
    const sublists = document.querySelectorAll('.categoriesAccordion__sublist');
    sublists.forEach((sublist) => {
      sublist.classList.remove('categoriesAccordion__sublist--visible');
    });
  };

  const handleCategoryClick = (category, classSuffix, collapsed) => {
    collapseAll();
    const sublist = document.querySelector(
      `.categoriesAccordion__sublist--${classSuffix}`
    );
    sublist.classList.toggle('categoriesAccordion__sublist--visible');
  };

  const handleProductClick = (product) => {
    navigate(
      generatePath(ROUTES.PRODUCTS, {
        query: product.toLowerCase(),
        replace: true,
      })
    );
    const catalogue = document.querySelector('.header__catalogue-container');
    catalogue.classList.remove('header__catalogue-container--visible');
    // window.location.reload();
  };

  return (
    <ListGroup className="categoriesAccordion__list">
      {categories.map((category) => {
        let classSuffix = category.split(' ')[0].toLowerCase();
        classSuffix = classSuffix === "today's" ? 'deals' : classSuffix;
        category === CATEGORIES.DAIRY_EGGS;
        const collapsed = Object.values(productsCategoriesMap).includes(
          category
        )
          ? 'categoriesAccordion__item--collapsed'
          : '';
        const classes = `categoriesAccordion__item  categoriesAccordion__item--${classSuffix}  ${collapsed}`;

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
                className={`categoriesAccordion__sublist  categoriesAccordion__sublist--${classSuffix}`}
              >
                <h4
                  className={`categoriesAccordion__subheader  categoriesAccordion__subheader--${classSuffix}`}
                  key={'subheader'}
                >
                  {category}
                </h4>
                {Object.entries(productsCategoriesMap).map(([key, value]) => {
                  return value === category ? (
                    <li
                      className="categoriesAccordion__subitem"
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
