Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content')
  },

	routes: {
		"": "dashboardShow",
    "friends": "friendsIndex",
    "study/:id": "studySesh"
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

  studySesh: function(id) {
    var user = Memgrow.Models.user;
    user.fetch();
    var courses = user.courses();
    var course = courses.getOrFetch(id);
    var cards = course.cards();
    // cards.fetch();

    // console.log(course)

    var view = new
     Memgrow.Views.StudySesh({
       current_user: user,
       model: course,
       collection: courses,
       cards: cards
    });

    this.swapView(view);
  },

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
