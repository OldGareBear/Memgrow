Memgrow.Views.DashboardShow = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.courses = options.courses;
    this.friends = options.friends;
    this.leaders = options.leaders;
  },

	template: JST['dashboard/show'],

	className: 'user-show',

	render: function() {

		content = this.template({
			current_user: this.model,
      courses: this.courses,
      friends: this.friends,
      leaders: this.leaders
		});

		this.$el.html(content);

		return this;
	},

  events: {
    "submit": "findFriends"
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
