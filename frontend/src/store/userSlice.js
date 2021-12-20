import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  isLoggedIn: true,
  loggedInUser: {
    user_id: '1234',
    user_name: 'customer01',
    user_favourite_sellers_ids: ['01', '03', '04', '05'],
    user_wishlist: [
      {
        product_name: 'chicken eggs',
        seller_id: '01',
        product_weight: '10 pcs',
        product_price: '2.5',
        product_image: 'chicken_eggs.jpg',
      },
      {
        product_name: 'milk',
        seller_id: '01',
        product_weight: '1 liter',
        product_price: '2.5',
        product_image: 'milk1.jpg',
      },
      {
        product_name: 'curd',
        seller_id: '01',
        product_weight: '1 kg',
        product_price: '4.5',
        product_image: 'curd1.jpg',
      },
      {
        product_image: 'curd3.jpg',
        product_name: 'curd',
        product_price: '4.8',
        product_weight: '1 kg',
        seller_id: '03',
      },
    ],
  },
};

const useSlice = createSlice({
  name: 'cities',
  initialState,
  reducers: {
    logInToggle(state) {
      state.isLoggedIn = !state.isLoggedIn;
    },
    handleFavourites(state, action) {
      if (
        state.loggedInUser.user_favourite_sellers_ids.includes(action.payload)
      ) {
        state.loggedInUser.user_favourite_sellers_ids =
          state.loggedInUser.user_favourite_sellers_ids.filter(
            (id) => id !== action.payload
          );
      } else {
        state.loggedInUser.user_favourite_sellers_ids.push(action.payload);
      }
    },
    handleFavouriteProducts(state, action) {
      const whatToCompare =
        action.payload.product_name + action.payload.seller_id;
      const filteredArr = state.loggedInUser.user_wishlist.filter(
        (item) => item.product_name + item.seller_id === whatToCompare
      );
      if (filteredArr.length > 0) {
        state.loggedInUser.user_wishlist =
          state.loggedInUser.user_wishlist.filter(
            (item) => item.product_name + item.seller_id !== whatToCompare
          );
      } else {
        state.loggedInUser.user_wishlist.push(action.payload);
      }
    },
  },
});

export const { logInToggle, handleFavourites, handleFavouriteProducts } =
  useSlice.actions;

export default useSlice.reducer;
