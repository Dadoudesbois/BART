import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

import { initUpdateNavbarOnScroll } from '../components/navbar';


import { initStarRating } from '../plugins/init_star_rating';

initStarRating();


initUpdateNavbarOnScroll();

window.initMapbox = initMapbox
initMapbox();
initAutocomplete();

