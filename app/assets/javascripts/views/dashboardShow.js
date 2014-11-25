Memgrow.Views.DashboardShow = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.courses = this.model.courses();
    this.friends = this.model.friends();
  },

	template: JST['dashboard/show'],

	className: 'user-show',

	render: function() {
    var leaders = this.generateLeaders();

		var content = this.template({
			current_user: this.model,
      courses: this.courses,
      friends: this.friends,
      leaders: leaders
		});

    this.$el.html(content);

    var $filePickerInput = this.$("input[type=filepicker]");

    filepicker.constructWidget($filePickerInput[0]);

		return this;
	},

  events: {
    "submit .find-friends": "findFriends",
		"click h1.username-display": "editUsername",
		"submit .changeName": "saveNewName"
  },

  generateLeaders: function() {
    var leaders = this.friends.clone();
    leaders.add(this.model);
    leaders = leaders.sortBy(function(leader) { return -leader.get("points"); });
    leaders = leaders.slice(0, 10);
    return leaders;
  },

  findFriends: function(event) {
		console.log("finding friends");
    event.preventDefault();
    var form = $(event.target).serializeJSON();
    var query = form["search"]["query"];
    var that = this;

    $.ajax({
      type: "GET",
      url: "api/search",
      data: { query: query },
      success: function(results) {
        that.renderSearchResults(results);
      }
    });
  },

  renderSearchResults: function(results) {
    var view = new Memgrow.Views.UserSearchResults({
      results: results
    });

    $('.content').html(view.render().$el);
  },
	
	editUsername: function(event) {
		$(event.currentTarget).html(
			"<form class='changeName'><input type='text' id='username' name=username value=" + this.model.get("username") + ">"
		);
		$("#username")[0].focus();
	},
	
	saveNewName: function(event) {
		event.preventDefault();
		var username = $("#username")[0].value;
		if (username === "") {
			username = this.model.get("username");
		}
		this.model.set({ username: username });
		this.model.save({});
		this.render();
	}
});










// scroll past
