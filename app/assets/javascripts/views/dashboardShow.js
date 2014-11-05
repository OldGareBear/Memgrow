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

    var $filePickerInput = this.$("input[type=filepicker]");

    // debugger
    filepicker.constructWidget($filePickerInput[0]);

		return this;
	},

  events: {
    "submit": "findFriends"
  },

  findFriends: function(event) {
    event.preventDefault();
    var form = $(event.target).serializeJSON();
    var query = form["search"]["query"];

    $.ajax({
      type: "GET",
      url: "api/search",
      data: { query: query }
    })
  }

});
