import algoliasearch from "algoliasearch";

const initRecipeAlgoliaSearch = () => {
  const inputRecipeField = document.querySelector("#search");

  const appId = document.querySelector("meta[name='algolia-app-id']").content;
  const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

  const client = algoliasearch(appId, searchOnlyApiKey);
  const recipeIndex = client.initIndex('Recipe');

  inputRecipeField.addEventListener("input", () => {
      recipeIndex.search(inputRecipeField.value, {
          restrictSearchableAttributes: ['title', 'ingredients'],
      }).then((response) => {
          console.log(response);
      })
  });
}

export { initRecipeAlgoliaSearch };