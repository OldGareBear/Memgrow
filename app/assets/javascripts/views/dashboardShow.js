Memgrow.Views.DashboardShow = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.courses = this.model.courses();
    this.friends = this.model.friends();
		// this.friendRequests = this.model.friendRequests();
  },

	template: JST['dashboard/show'],

	className: 'user-show',

	render: function() {
    var leaders = this.generateLeaders();

    console.log(leaders);

		var content = this.template({
			current_user: this.model,
      courses: this.courses,
      friends: this.friends,
			// friendRequests: this.friendRequests,
      leaders: leaders
		});

    this.$el.html(content);

    var $filePickerInput = this.$("input[type=filepicker]");

    filepicker.constructWidget($filePickerInput[0]);

		return this;
	},

  events: {
    "submit": "findFriends"
  },

  generateLeaders: function() {
    var leaders = this.friends.clone();
    leaders.add(this.model);
    leaders = leaders.sortBy(function(leader) { return -leader.get("points"); });
    leaders = leaders.slice(0, 10);
    return leaders;
  },

  findFriends: function(event) {
    console.log("finding friends...")
    event.preventDefault();
    var form = $(event.target).serializeJSON();
    var query = form["search"]["query"];
    var that = this;

    $.ajax({
      type: "GET",
      url: "api/search",
      data: { query: query },
      success: function(results) {
        console.log("ajax request response:", results)
        that.renderSearchResults(results);
      }
    });
  },

  renderSearchResults: function(results) {
    var view = new Memgrow.Views.UserSearchResults({
      results: results
    });
    console.log("rendering search results:", results);

    $('.content').html(view.render().$el);
  }

});










// scroll past
