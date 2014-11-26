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
			currentUser: this.model,
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
		"input .find-friends": "previewSearch",
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
	
	previewSearch: function(event) {
		var view = this;
		var val = this.$(event.target).val();
    if (val.length >= 2) {
      $.ajax({
	      type: "GET",
	      url: "api/search",
	      data: { query: val },
	      success: function(results) {
					view.$("div.search-preview").removeClass("hidden");
					view.renderPreview(results);
				}
      });
    } else {
			// clear results if the user starts typing something new or deletes input
			$("div.search-preview").children().remove();
			$("div.search-preview").addClass("hidden");
    }
	},
	
	renderPreview: function(results) {
		results.forEach(function(result) {
			var match = $("<a>").addClass("match");
			match.text(result.username);
			match.attr("href", "#users/" + result.id);
  		$("div.search-preview").append(match);
			
		});
	},

  findFriends: function(event) {
    event.preventDefault();
    var form = $(event.target).serializeJSON();
    var query = form["search"]["query"];
    var view = this;

    $.ajax({
      type: "GET",
      url: "api/search",
      data: { query: query },
      success: function(results) {
        view.renderSearchResults(results);
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
