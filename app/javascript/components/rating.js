const initRating = () => {
 // let store all stars inside a variable
 const starRadio = document.querySelectorAll(".star")
 const radioButtons = document.querySelectorAll(".form-check")

 // let set variable current rating set to 0
 let currentRating = 0
 // loop over all stars
  radioButtons.forEach((button) => {
    console.log(button);
    button.addEventListener('mouseover', () => {
      console.log("click event")
      const radioButtonsArray = Array.from(radioButtons);
      currentRating = radioButtonsArray.indexOf(button);
      console.log(currentRating)
      starRadio.forEach((s) => {
        const starRadioArray = Array.from(starRadio);
        if (starRadioArray.indexOf(s) <= currentRating) {
          s.innerHTML = "<i class='fas fa-star'></i>"
        } else {
          s.innerHTML = "<i class='far fa-star'></i>"
        }
      });
    });
  });

   //for each star add an event listener that will on hover do
     // reaassign current rating to be value of hovered star
     // loop over all stars and set class to filled
     // if equal to or lower than the current rating
     // else set class to unfilled
}

export {initRating}
