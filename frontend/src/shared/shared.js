export const sortProductsByMinPrice = (array) => {
  return array.sort((a, b) => {
    if (+a.product_price < +b.product_price) {
      return 1;
    }
    if (+a.product_price > +b.product_price) {
      return -1;
    }
    return 0;
  });
};
export const sortProductsByMaxPrice = (array) => {
  return array.sort((a, b) => {
    if (+a.product_price > +b.product_price) {
      return 1;
    }
    if (+a.product_price < +b.product_price) {
      return -1;
    }
    return 0;
  });
};
