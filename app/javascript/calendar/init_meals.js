import {fetchWithToken } from "../utils/fetch_with_token";
const initMeals = () => {
  const update = document.querySelector('#update-btn');
  const meals = document.querySelectorAll('.meal-card');
  const deleteBtn = document.querySelector('#delete-btn');
  if (deleteBtn) {
    deleteBtn.style.display = "none";
  }
  const toggleActiveClass = (event) => {
    event.currentTarget.classList.toggle('active');
    if (deleteBtn.style.display === "none") {
        deleteBtn.style.display = "block";
    } else {
        deleteBtn.style.display = "none";
    };
    meals.forEach((meal) => {
      meal.classList.toggle('clickable');
      meal.classList.remove('active');
    });
  };

  if (update) {
    update.addEventListener('click', toggleActiveClass);
  }
  const array = document.querySelector('.array-chosen');
  const mealsChosen = [];
  meals.forEach((meal) => {
    meal.addEventListener('click', (e) => {
      if (update.classList.contains('active')){
        e.currentTarget.classList.toggle('active');
      };
      if (meal.classList.contains('active')){
        mealsChosen.push(meal.dataset.mealId);
        array.innerText = mealsChosen;
      } else {
        mealsChosen.splice( mealsChosen.indexOf(meal.dataset.mealId), 1);
        array.innerText = mealsChosen;
      };
    });
  });

  if (deleteBtn) {
    deleteBtn.addEventListener('click', (e) => {
      event.preventDefault();
      fetchWithToken('/meals', {
        method: 'delete',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ meal_ids: mealsChosen})}).then(()=> location.reload());
    });
  }
};

export{ initMeals };
