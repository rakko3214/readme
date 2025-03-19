// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

window.onload = function () {
  const spinner = document.getElementById("loading");
  spinner.classList.add("loaded");
};
