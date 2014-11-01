window.Memgrow = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		alert("I am gay!");
    new Memgrow.Routers.Router({
      $rootEl: $("div.user-show-content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Memgrow.initialize();
});
