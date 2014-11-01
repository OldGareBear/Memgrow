Memgrow.Routers.Router = Back.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },
	
	routes: {
		"users/:id": "userShow"
	},
	
	userShow: function(id) {
		view = new Memgrow.Views.UserShow({
			this.collection: Memgrow.Collections.users;
			this.model: Memgrow.Collections.users.get(id)
		})
		
		this.$rootEl.html(view.render().$el)
	}
});