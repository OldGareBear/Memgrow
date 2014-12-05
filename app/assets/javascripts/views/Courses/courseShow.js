Memgrow.Views.CourseShow = Backbone.View.extend({
	initialize: function(options) {
		this.currentUser = options.currentUser;
		this.comments = this.model.comments();

		this.listenTo(this.comments, "sync add remove", this.render)
		this.listenTo(this.model, "sync", this.render)
		this.listenTo(this.currentUser, "sync", this.render)
	},

	template: JST["courses/show"],

	render: function() {
		console.log(this.currentUser.courses());
		console.log(this.model);
		console.log(this.currentUser.courses().get(this.model.id) === this.model);
		// console.log(this.currentUser.courses().models().include(this.model));

		var cards = this.model.cards();

		var content = this.template({
			course: this.model,
			cards: cards,
			currentUser: this.currentUser,
			comments: this.comments
		});

		this.$el.html(content);

		return this;
	},

	events: {
		"submit .new-comment": "newComment",
		"submit .new-enrollment": "newEnrollment",
		"submit .delete-course": "deleteCourse"
	},

	newComment: function(event) {
		event.preventDefault();

		var params = $(event.target).serializeJSON();

		var view = this;

		$.ajax({
			type: "POST",
			url: "api/comments",
			data: params,
			success: function(results) {
				console.log("your comment has been posted");
				view.model.comments().add(results);
				console.log('new comment', results);
				view.render();
			}
		});
	},

	newEnrollment: function(event) {
		event.preventDefault();

		var course_id = $(event.target).serializeJSON()["enrollment"];

    $.ajax({
      type: "POST",
      url: "api/enrollments",
      data: course_id,
      success: function(results) {
        console.log("your course has been added!");
      }
    });
	},

	deleteCourse: function(event) {
		event.preventDefault();

		var course_id = $(event.target).serializeJSON();

		$.ajax({
			type: "DELETE",
			url: "api/courses/" + course_id["id"],
			data: course_id,
			success: function(results) {
				Backbone.history.navigate("#/courses", { trigger: true });
			}
		});
	}

});
