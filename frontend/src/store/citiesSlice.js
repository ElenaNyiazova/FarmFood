import { createSlice } from '@reduxjs/toolkit';

import { CITIES } from '../consts/consts';

const initialState = {
  selectedCity: CITIES.MINSK,
  allCities: Object.values(CITIES),
};

const citiesSlice = createSlice({
  name: 'cities',
  initialState,
  reducers: {
    selectedCityChanged(state, action) {
      state.selectedCity = action.payload;
    },
  },
});

export const { selectedCityChanged } = citiesSlice.actions;

export default citiesSlice.reducer;
