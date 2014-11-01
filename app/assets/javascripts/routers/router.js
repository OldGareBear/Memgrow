Memgrow.Routers.Router = Back.Router.extend({
	routes: {
		"": "userShow"
	},
	
	userShow: function() {
		view = new Memgrow.Views.UserShow({
			this.collection: Memgrow.Collections.users
		})
	}
});