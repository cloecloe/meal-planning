// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFavoriteAlgoliaSearch } from "../plugins/init_favorite_algolia_search";
import { initRecipeAlgoliaSearch } from "../plugins/init_recipe_algolia_search";

// import { initMeals } from "../calendar/init_meals";
import { initRating} from "../components/rating";
import { mealSelection} from "../components/meal_modal";
// import { editDisplay} from "../components/edit_display";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initRating()
  initFavoriteAlgoliaSearch();
  initRecipeAlgoliaSearch();
  // editDisplay();
  mealSelection()
  // initMeals();

  if (document.querySelector("#fav-search")) {
    initFavoriteAlgoliaSearch();
  }
  if (document.querySelector("#search")) {
    initRecipeAlgoliaSearch();
  }
});

