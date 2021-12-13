import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  isLoggedIn: false,
  loggedInUser: {
    user_id: '1234',
    user_name: 'customer01',
    user_favourite_sellers_ids: ['01', '02'],
  },
};

const useSlice = createSlice({
  name: 'cities',
  initialState,
  reducers: {
    logInToggle(state) {
      state.isLoggedIn = !state.isLoggedIn;
    },
  },
});

export const { logInToggle } = useSlice.actions;

export default useSlice.reducer;
