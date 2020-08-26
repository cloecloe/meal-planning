import algoliasearch from "algoliasearch";

const initFavoriteAlgoliaSearch = () => {
  const inputFavoriteField = document.querySelector("#search");
  
  const appId = document.querySelector("meta[name='algolia-app-id']").content;
  const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;
  const currentUserId = document.querySelector("meta[name='current_user_id']").content;

  const client = algoliasearch(appId, searchOnlyApiKey);
  const favoriteIndex = client.initIndex('Favorite');
  
  inputFavoriteField.addEventListener("input", () => {
    favoriteIndex.search(inputFavoriteField.value, {
      filters: `user_ids:${currentUserId}`
      }).then((response) => {
      console.log(response);
    })
  });
}

export { initFavoriteAlgoliaSearch };