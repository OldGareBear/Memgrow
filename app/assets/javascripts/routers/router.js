Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },
	
	routes: {
		"": "userShow"
	},
	
	userShow: function() {
		view = new Memgrow.Views.UserShow({
			model: Memgrow.Models.user
		})
		
		this.$rootEl.html(view.render().$el)
	}
});