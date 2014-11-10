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
		var cards = this.model.cards();
		
		console.log("comments", this.comments)
		
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
		"submit .new-enrollment": "newEnrollment"
	},
	
	newComment: function(event) {
		event.preventDefault();
		
		var params = $(event.target).serializeJSON();
		console.log("params", params);
		
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
		
		console.log(course_id);
		
    $.ajax({
      type: "POST",
      url: "api/enrollments",
      data: course_id,
      success: function(results) {
        console.log("your course has been added!");
      }
    });
	}
	
});