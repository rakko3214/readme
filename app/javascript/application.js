// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


const loading = document.querySelector(".loading");

window.addEventListener("load", () => {
  console.log("発火タイミング");
  setTimeout(() => {
    loading.classList.add("loaded");
  }, 1000);
});