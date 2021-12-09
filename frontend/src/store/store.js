import { configureStore } from "@reduxjs/toolkit";
import sellersReducer from "./sellersSlice";

export const store = configureStore({
  reducer: {
    sellers: sellersReducer,
  },
});
