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
  // 検索ボックスの状態を復元
  const searchField = document.querySelector('input[name="q[title_or_ingredient_cont]"]');
  if (searchField) {
    searchField.value = sessionStorage.getItem('search_query') || '';
  }

  // 検索ボックスの変更を検知して状態を保存
  if (searchField) {
    searchField.addEventListener('input', function() {
      sessionStorage.setItem('search_query', this.value);
    });
  }

  // チェックボックスの状態を復元
  const recipeCheckboxes = document.querySelectorAll('input[type=checkbox][name="menu[recipe_ids][]"]');
  recipeCheckboxes.forEach(checkbox => {
    const recipeId = checkbox.value;
    const isChecked = sessionStorage.getItem(`recipe_${recipeId}`) === 'true';
    checkbox.checked = isChecked;
  });

  // チェックボックスの変更を検知して状態を保存
  recipeCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      sessionStorage.setItem(`recipe_${this.value}`, this.checked);
    });
  });
});