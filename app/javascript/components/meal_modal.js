import {fetchWithToken} from "../utils/fetch_with_token"

const mealSelection = () => {
  const allMeals = document.querySelectorAll(".add-meal-button")
  console.log(allMeals);
  allMeals.forEach((meal) => {
    meal.addEventListener("click", (event) => {
      allMeals.forEach((meal) => {
        meal.classList.remove("selected");
      })
      event.currentTarget.classList.toggle("selected");
    });
  })
  const recipes = document.querySelectorAll(".recipe-result")
  recipes.forEach((recipe) => {
    recipe.addEventListener("click", (event) => {
      const selectedButton = document.querySelector(".add-meal-button.selected")
      fetchWithToken(`/recipes/${recipe.dataset.recipeId}/meals`, {
        method: "post",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          meal: {
            tagname: selectedButton.dataset.tagname,
            date: selectedButton.dataset.date
          }
        })
      }).then(() => location.reload());
    });
  });
};


export {mealSelection};
