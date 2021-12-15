import {
  createAsyncThunk,
  createSlice,
  createEntityAdapter,
  createSelector,
} from '@reduxjs/toolkit';

import { dummySellers } from './dummySellers';

export const fetchSellers = createAsyncThunk(
  'sellers/fetchSellers',
  async () => {
    const res = await fetch('https://jsonplaceholder.typicode.com/todos/');
    const json = await res.json();
    return json;
  }
);

const sellersAdapter = createEntityAdapter();

const initialState = sellersAdapter.getInitialState(dummySellers);

const sellersSlice = createSlice({
  name: 'sellers',
  initialState,
  reducers: {
    createSeller: sellersAdapter.addOne,
    updateSeller: sellersAdapter.updateOne,
  },
  extraReducers: (builder) => {
    // builder.addCase(fetchSellers.fulfilled, sellersAdapter.setAll);  // потом эту строку раскоментить и все подтягиваемые селлеры автоматом закинутся в стейт
    builder.addCase(fetchSellers.fulfilled, (state, action) => {
      console.log(action.payload);
    });
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
