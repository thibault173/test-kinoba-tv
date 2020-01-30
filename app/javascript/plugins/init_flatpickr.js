import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS

const initFlatpickr = () => {
  const inputSearchBirthdate = document.getElementById('flatpickr-search-birthdate');
  if (inputSearchBirthdate) {
    flatpickr("#flatpickr-search-birthdate", {
      dateFormat: "d-m-Y",
    });
  }

  const inputBirthdate = document.getElementById('flatpickr-input-birthdate');
  if (inputBirthdate) {
    flatpickr("#flatpickr-input-birthdate", {
      dateFormat: "d-m-Y",
    });
  }
};

export default initFlatpickr
