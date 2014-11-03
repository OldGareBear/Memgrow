Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },

	routes: {
		"": "dashboardShow"
	},

	dashboardShow: function() {
		Memgrow.Models.user.fetch();
    var user = Memgrow.Models.user;
    var courses = user.courses();
    courses.fetch();
		view = new Memgrow.Views.DashboardShow({
			model: user,
      collection: user.courses
		});

		this.$rootEl.html(view.render().$el); // replace with swap view
	}
});