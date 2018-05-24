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
  const submit = (e) => {
    console.log(e);
    e.preventDefault();
    const button = e.currentTarget;
    if (button.className === "favorite-submit") {
      console.log("this is submit");
    }
  };
  // document.querySelectorAll("#restaurants")

  // --- your code here!



  // adding new photos

  // --- your code here!



});
