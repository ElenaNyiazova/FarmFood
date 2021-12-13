import { createSlice } from '@reduxjs/toolkit';

import { CITIES } from '../consts/consts';

const initialState = {
  selectedCity: CITIES.MINSK,
  allCities: Object.values(CITIES),
  showLocationModal: true,
};

const citiesSlice = createSlice({
  name: 'cities',
  initialState,
  reducers: {
    selectedCityChanged(state, action) {
      state.selectedCity = action.payload;
    },
    showLocationModalToggled(state) {
      state.showLocationModal = false;
    },
  },
});

export const { selectedCityChanged, showLocationModalToggled } =
  citiesSlice.actions;

export default citiesSlice.reducer;
