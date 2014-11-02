Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },
	
	routes: {
		"": "dashboardShow"
	},
	
	dashboardShow: function() {
		Memgrow.Models.user.fetch();
		
		view = new Memgrow.Views.DashboardShow({ 
			model: Memgrow.Models.user 
		});
		
		this.$rootEl.html(view.render().$el); // replace with swap view
	}
});