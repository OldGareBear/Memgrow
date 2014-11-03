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
    // console.log(this.model)
		content = this.template({
			current_user: this.model,
      courses: this.courses,
      friends: this.friends,
      leaders: this.leaders
		});

		this.$el.html(content);
		return this;
	}

});