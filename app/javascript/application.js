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
