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

document.addEventListener('DOMContentLoaded', function() {
  // チェックボックスの状態を復元
  console.log("d");
  const recipeCheckboxes = document.querySelectorAll('input[type=checkbox][name="menu[recipe_ids][]"]');
  recipeCheckboxes.forEach(checkbox => {
    const recipeId = checkbox.value;
    const isChecked = localStorage.getItem(`recipe_${recipeId}`) === 'true';
    checkbox.checked = isChecked;
  });

  // チェックボックスの変更を検知して状態を保存
  recipeCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      localStorage.setItem(`recipe_${this.value}`, this.checked);
    });
  });
});