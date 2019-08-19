import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelectorAll("#profile_address, #bar_address");
  // document.getElementById('profile_address') + document.getElementById('bar_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
