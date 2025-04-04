// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


window.addEventListener('turbo:load', ()=>{
  console.log("発火");
  const spinner = document.getElementById("loading");
  spinner.classList.add("loaded");
});