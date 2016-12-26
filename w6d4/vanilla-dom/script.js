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

  const listContainerEl = document.getElementById("list-form");

  listContainerEl.addEventListener("submit", event => {
    event.preventDefault();

    const newFavoriteInputEl = document.getElementByClassName("favorite-submit");
    const newFavorite = newFavoriteInputEl.value;
    newFavoriteInputEl.value = "";

    const places = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = newFavorite;
    places.appendChild(li);
  });

  // --- your code here!



  // adding new photos

  // --- your code here!



});
