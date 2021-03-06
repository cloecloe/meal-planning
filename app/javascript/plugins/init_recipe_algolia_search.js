import algoliasearch from "algoliasearch";

const buildCards = (response) => {
  const results = document.getElementById("results");
  const algoIDs = response.hits.map(recipe => parseInt(recipe.objectID, 10));
  document.querySelectorAll(".recipe-result").forEach((card) => {
    if (!algoIDs.includes(Number(card.dataset.recipeId))) {
      card.hidden = true;
    } else if (algoIDs.includes(Number(card.dataset.recipeId))) {
      card.hidden = false;
    }
  });
}

const initRecipeAlgoliaSearch = () => {
  const inputRecipeField = document.querySelector("#calendar-search");
  const appId = document.querySelector("meta[name='algolia-app-id']").content;
  const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;

  const client = algoliasearch(appId, searchOnlyApiKey);
  const recipeIndex = client.initIndex('Recipe');

  const results = document.getElementById("results");

  if (inputRecipeField) {
    inputRecipeField.addEventListener("input", () => {
        recipeIndex.search(inputRecipeField.value, {
            restrictSearchableAttributes: ['title', 'ingredients'],
            minWordSizefor1Typo: 2
        }).then((response) => {
            if (results) {
              buildCards(response);
            };
        })
    });
  }
}

export { initRecipeAlgoliaSearch };
