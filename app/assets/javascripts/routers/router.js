Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content');
    this.bindNotificationEvents();
  },

	routes: {
		"": "dashboardShow",
    "friends": "friendsIndex",
    "study/:id": "studySesh",
		"courses/new": "coursesNew",
		"cards/new": "cardsNew"
	},

  bindNotificationEvents: function() {
    var notificationsLi = $("li#notifications")
    notificationsLi.on("click", function() {
      console.log("You have clicked meh!");
      // remove the hidden class from the dropdown
      $("div.dropdown").removeClass("hidden");
    });
  },

	dashboardShow: function() {
		Memgrow.Models.user.fetch();
    var user = Memgrow.Models.user;

		var view = new Memgrow.Views.DashboardShow({
			model: user,
		});

		this.swapView(view);
	},

  friendsIndex: function(){
    Memgrow.Models.user.fetch();

    // var friends = Memgrow.Models.user.friends();
    // friends.fetch()

    var view = new Memgrow.Views.FriendsIndex({
      // collection: friends
      model: Memgrow.Models.user
    });

    this.swapView(view);
  },

  studySesh: function(id) {
    var user = Memgrow.Models.user;
    user.fetch();
    var courses = user.courses();
    var course = courses.getOrFetch(id);
    var cards = course.cards();

    var view = new
     Memgrow.Views.StudySesh({
       current_user: user,
       model: course,
       collection: courses,
       cards: cards
    });

    this.swapView(view);
  },

	coursesNew: function() {
    var user = Memgrow.Models.user;
    user.fetch();
		var courses = user.courses();

		var view = new Memgrow.Views.CourseNew({
			model: user,
			collection: courses
		});

		this.swapView(view);
	},

	cardsNew: function() {
		var user = Memgrow.Models.user;
		user.fetch();
		var courses = user.courses().models;
		var course = courses[courses.length - 1];

		console.log(course); //should always be the most recently created course model

		var view = new Memgrow.Views.CardsNew({
			model: course
		});

		this.swapView(view);
	},

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
