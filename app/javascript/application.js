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

document.addEventListener('DOMContentLoaded', () => {
  const recipeCheckboxes = document.querySelectorAll('input[name="menu[recipe_ids][]"]');

  // セッションからチェックボックスの状態を復元
  recipeCheckboxes.forEach((checkbox) => {
      if (sessionStorage.getItem(checkbox.id) === 'true') {
          checkbox.checked = true;
      }
  });

  // チェックボックスの変更を検知して状態をセッションに保存
  recipeCheckboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', () => {
          sessionStorage.setItem(checkbox.id, checkbox.checked);
      });
  });
});

document.addEventListener('turbo:load', () => {
  const recipeCheckboxes = document.querySelectorAll('input[name="menu[recipe_ids][]"]');

  // セッションからチェックボックスの状態を復元
  recipeCheckboxes.forEach((checkbox) => {
      if (sessionStorage.getItem(checkbox.id) === 'true') {
          checkbox.checked = true;
      }
  });

  // チェックボックスの変更を検知して状態をセッションに保存
  recipeCheckboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', () => {
          sessionStorage.setItem(checkbox.id, checkbox.checked);
      });
  });
});