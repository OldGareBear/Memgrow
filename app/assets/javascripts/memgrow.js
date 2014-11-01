window.Memgrow = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		alert("Hello from Backbone!");
    new Memgrow.Routers.Router();
    Backbone.history.start();
  }
};
