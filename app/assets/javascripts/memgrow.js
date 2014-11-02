window.Memgrow = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Memgrow.Routers.Router();
    Backbone.history.start();
  }
};
