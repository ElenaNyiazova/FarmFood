import { configureStore } from "@reduxjs/toolkit";
import sellersReducer from "./sellersSlice";
import productsReducer from "./productsSlice";

export const store = configureStore({
  reducer: {
    sellers: sellersReducer,
    products: productsReducer,
  },
});
