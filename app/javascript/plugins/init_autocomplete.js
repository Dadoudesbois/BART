import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bar_address');
  if (addressInput) {
    places({ container: addressInput });
    places({ container: document.getElementById('profile_address') });
  }
};

export { initAutocomplete };
