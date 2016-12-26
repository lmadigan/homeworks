document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // const listContainerEl = document.getElementById("list-form");
  //
  // listContainerEl.addEventListener("submit", event => {
  //   event.preventDefault();
  //
  //   const newFavoriteInputEl = document.getElementByClassName("favorite-submit");
  //   const newFavorite = newFavoriteInputEl.value;
  //   newFavoriteInputEl.value = "";
  //
  //   const places = document.getElementById("sf-places");
  //   const li = document.createElement("li");
  //   li.textContent = newFavorite;
  //   places.appendChild(li);
  // });

  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
    favoriteInput.value = "";

    const newListLi = document.createElement("li");
    newListLi.textContent = favorite;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newListLi);

  };
  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);

  // --- your code here!



  // adding new photos

  // --- your code here!


  const photoShowButton = document.querySelector(".photo-show-button");
  photoShowButton.addEventListener("click", event => {
    const photoFormContainer = document.querySelector(".photo-form-container");
    if (photoFormContainer.className === "photo-form-container") {
      photoFormContainer.className = "photo-form-container hidden";
    } else {
      photoFormContainer.className = "photo-form-container";
    }
  });

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const dogPhotos = document.querySelector(".dog-photos");
    const newPhotoLi = document.createElement("li");

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    newPhotoLi.appendChild(newImg);

    dogPhotos.appendChild(newPhotoLi);

  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);

});
