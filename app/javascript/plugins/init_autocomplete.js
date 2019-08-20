import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector("#bar_address");
  //document.getElementById('profile_address') + document.getElementById('bar_address');
  if (addressInput) {
    places({ container: addressInput });
    places({ container: document.querySelector("#profile_address") });
  }
};

export { initAutocomplete };
