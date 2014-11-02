Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },
	
	routes: {
		"": "userShow"
	},
	
	userShow: function(id) {
		user = Memgrow.Collections.users.getOrFetch(id);
		view = new Memgrow.Views.UserShow({ model: user });
		
		this.$rootEl.html(view.render().$el); // replace with swap view
	}
});