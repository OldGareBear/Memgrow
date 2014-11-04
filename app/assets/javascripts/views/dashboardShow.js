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
	}

});
