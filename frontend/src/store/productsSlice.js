import {
  // createAsyncThunk,
  createSlice,
  createEntityAdapter,
  createSelector,
} from "@reduxjs/toolkit";

import { dummyProducts } from "./dummyProducts";

const productsAdapter = createEntityAdapter();

const initialState = productsAdapter.getInitialState(dummyProducts);

const productsSlice = createSlice({
  name: "products",
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

export const selectProductsBySellerId = createSelector(
  [selectAllProducts, (state, sellersId) => sellersId],
  (products, sellersId) => {
    return products.filter((product) => product.seller_id.includes(sellersId));
  }
);
