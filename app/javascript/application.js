// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

$(document).on('turbolinks:load', function() {
  $(function(){
    var loader = $('.loader-wrap');

    $(window).on('load',function(){
      loader.fadeOut();
    });

    setTimeout(function(){
      loader.fadeOut();
    },2000);
  });
});
