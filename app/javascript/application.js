// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

window.addEventListener('turbo:load', ()=>{
  const spinner = document.getElementById("loading");
  spinner.classList.add("loaded");
});

window.addEventListener('turbo:render', ()=>{
  console.log("aa");
  const spinner = document.getElementById("loading");
  spinner.classList.add("loaded");
});

document.addEventListener('turbo:load', () => {
  const recipeCheckboxes = document.querySelectorAll('input[name="menu[recipe_ids][]"]');

  recipeCheckboxes.forEach((checkbox) => {
      if (sessionStorage.getItem(checkbox.id) === 'true') {
          checkbox.checked = true;
      }
  });

  recipeCheckboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', () => {
          sessionStorage.setItem(checkbox.id, checkbox.checked);
      });
  });
});
