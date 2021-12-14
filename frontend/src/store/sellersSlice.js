import {
  // createAsyncThunk,
  createSlice,
  createEntityAdapter,
  createSelector,
} from "@reduxjs/toolkit";

import { dummySellers } from "./dummySellers";

const sellersAdapter = createEntityAdapter();

const initialState = sellersAdapter.getInitialState(dummySellers);

const sellersSlice = createSlice({
  name: "sellers",
  initialState,
  reducers: {
    createSeller: sellersAdapter.addOne,
    updateSeller: sellersAdapter.updateOne,
  },
});

export const { createSeller, updateSeller } = sellersSlice.actions;

export default sellersSlice.reducer;

export const {
  selectAll: selectSellers,
  selectIds: selectSellersIds,
  selectById: selectSellerById,
} = sellersAdapter.getSelectors((state) => state.sellers);

export const selectAllAvailableProducts = createSelector(
  selectSellers,
  (sellers) => {
    const allProducts = sellers.reduce(
      (acc, seller) => [...acc, ...seller.seller_products],
      []
    );
    return [...new Set(allProducts)];
  }
);
