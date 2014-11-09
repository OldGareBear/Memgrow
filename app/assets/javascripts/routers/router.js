Memgrow.Routers.Router = Backbone.Router.extend({
  initialize: function() {
    this.$rootEl = $('.content');
    this.bindNotificationEvents();
  },

	routes: {
		"": "dashboardShow",
    "friends": "friendsIndex",
    "study/:id": "studySesh",
		"courses": "coursesIndex",
		"courses/new": "coursesNew",
		"courses/:id": "courseShow",
		"cards/new": "cardsNew",
		"users/:id": "userShow"
	},

  bindNotificationEvents: function() {
    var router = this;
    var notificationsLi = $("li#notifications")

    // remove the hidden class from the dropdown
    notificationsLi.on("click", function() {
      $("div.dropdown").toggleClass("hidden");
    });

    // and reinstall it on mouseleave
    $("div.dropdown").on("mouseleave", function() {
      $("div.dropdown").addClass("hidden");
    });

    $("button.accept-friend-request").on("click", function(event) {
      var requester_id = $(event.currentTarget).data("id");
      var status = "accepted";
      router.handleFriendRequest(requester_id, status);

      var notification = $(event.currentTarget).parent();

      notification.addClass("hidden");
    });

    $("button.decline-friend-request").on("click", function(event) {
      var requester_id = $(event.currentTarget).data("id");
      var status = "declined";
      router.handleFriendRequest(requester_id, status);

      var notification = $(event.currentTarget).parent();

      notification.addClass("hidden");
    });
  },

  handleFriendRequest: function(requester_id, status) {
    console.log("friend request being handled...")
    var user = Memgrow.Models.user;
    var friendRequests = user.friendRequests();
    var friendRequest = friendRequests.findWhere({ requester_id: requester_id });

    var num_courses = $("p.notifications").text() - 1;

    $.ajax({
      type: "PUT",
      url: "/api/friendships/" + friendRequest.get("id"),
      data: { status: status },
      success: function(results) {
        console.log("friend request has been responded to");

        $("p.notifications").text(num_courses);
      }
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

    var view = new Memgrow.Views.FriendsIndex({
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
	
	courseShow: function(id) {
		var courses = Memgrow.Collections.courses;
		var course = courses.getOrFetch(id);
		console.log(course);
		var currentUser = Memgrow.Models.user;
		currentUser.fetch();
		
		var view = new Memgrow.Views.CourseShow({
			model: course,
			currentUser: currentUser,
		}) 
		
		this.swapView(view);
	},
	
	coursesIndex: function() {
		var currentUser = Memgrow.Models.user;
		currentUser.fetch();
		var courses = Memgrow.Collections.courses;
		courses.fetch();
		
		var view = new Memgrow.Views.CoursesIndex({
			collection: courses,
			model: currentUser
		});
		
		this.swapView(view);
	},
	
	userShow: function(id) {
		var other_user = Memgrow.Models.OtherUser(); // do I need to get or fetch from a collection? or can backbone tells from the url how to create the otherUser? it seems strange to not have to do anything with this id
		console.log(other_user);
		
		var view = new Memgrow.Views.userShow({
			model: other_user
		}); // make this view and a jbuilder for users
	},

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
