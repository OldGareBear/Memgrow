Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },

	routes: {
		"": "dashboardShow",
    "friends": "friendsIndex",
    "courses/:id": "studySession"
	},

	dashboardShow: function() {
		Memgrow.Models.user.fetch();
    var user = Memgrow.Models.user;

    var courses = user.courses();
    var friends = user.friends();
    var leaders = user.leaders();

		var view = new Memgrow.Views.DashboardShow({
			model: user,
      courses: courses,
      friends: friends,
      leaders: leaders
		});

		this.swapView(view);
	},

  friendsIndex: function(){
    Memgrow.Models.user.fetch();

    var friends = Memgrow.Models.user.friends();
    friends.fetch()

    var view = new Memgrow.Views.FriendsIndex({
      collection: friends
    });

    this.swapView(view);
  },

  studySession: function(id) {
    var courses = Memgrow.Models.user.courses();
    var course = courses.getOrFetch(id)
  },

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
