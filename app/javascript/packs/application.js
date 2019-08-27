import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();

// const event_elements = document.getElementById("event_elements")
// const search_input = document.querySelector("#event_search")


// search_input.addEventListener('submit', (event) => {
//   event.preventDefault(); // <-- to prevent <form>'s native behaviour
//   const input = event.currentTarget.querySelector('.form-control');
//   // results.innerHTML = '';
//   event_elements.innerHTML = input.value;
// });





