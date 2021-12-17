import {
  // createAsyncThunk,
  createSlice,
  createEntityAdapter,
  createSelector,
} from '@reduxjs/toolkit';

import { dummyProducts } from './dummyProducts';

const productsAdapter = createEntityAdapter();

const initialState = productsAdapter.getInitialState(dummyProducts);

const productsSlice = createSlice({
  name: 'products',
  initialState,
  reducers: {
    createProduct: productsAdapter.addOne,
    updateProduct: productsAdapter.updateOne,
  },
});

export const { createProduct, updateProduct } = productsSlice.actions;

export default productsSlice.reducer;

export const {
  selectAll: selectAllProducts,
  selectIds: selectProductsIds,
  selectById: selectProductById,
} = productsAdapter.getSelectors((state) => state.products);

// export const selectProductsBySellerId = createSelector(
//   [selectAllProducts, (state, sellersId) => sellersId],
//   (products, sellersId) => {
//     return products.filter((product) => product.seller_id.includes(sellersId));
//   }
// );

export const selectProductsBySellerId = createSelector(
  [selectAllProducts, (state, sellersId) => sellersId],
  (products, sellersId) => {
    const items = products.map((product) => {
      const itemsArr = Object.values(product.items);
      return itemsArr;
    });
    const resultArray = items.map((item) => {
      return item.filter((product) => product.seller_id === sellersId);
    });
    const result = resultArray.reduce((subArr, acc) => [...subArr, ...acc], []);
    return result;
  }
);
