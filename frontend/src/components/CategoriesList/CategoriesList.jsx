import React from 'react';
import { ListGroup } from 'react-bootstrap';

import { CATEGORIES } from '../../consts/consts';

import './CategoriesList.css';

export const CategoriesList = () => {
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

      // turn off sliders previous button
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
    console.log(product);
  };

  return (
    <ListGroup className="categories__list" onBlur={handleCategoriesBlur}>
      {categories.map((category) => {
        let classSuffix = category.split(' ')[0].toLowerCase();
        classSuffix = classSuffix === "today's" ? 'deals' : classSuffix;
        const collapsed =
          category === CATEGORIES.FRUITS || category === CATEGORIES.VEGETABLES
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
                <li
                  className="categories__subitem"
                  key={'01'}
                  onMouseDown={() => handleProductClick('product_name')}
                >
                  Apple
                </li>
                <li
                  className="categories__subitem"
                  key={'02'}
                  onMouseDown={() => handleProductClick('product_name')}
                >
                  Pear
                </li>
                <li
                  className="categories__subitem"
                  key={'03'}
                  onMouseDown={() => handleProductClick('product_name')}
                >
                  Plum
                </li>
                <li
                  className="categories__subitem"
                  key={'04'}
                  onMouseDown={() => handleProductClick('product_name')}
                >
                  Peach
                </li>
              </ul>
            )}
          </div>
        );
      })}
    </ListGroup>
  );
};
