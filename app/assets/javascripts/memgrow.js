window.Memgrow = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		alert("hello from backbone!")
    new PostApp.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Memgrow.initialize();
});
