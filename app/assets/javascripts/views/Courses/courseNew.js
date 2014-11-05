Memgrow.Views.CourseNew = Backbone.View.extend({
	intitialize: function() {
		this.current_template = JST['courses/new']
		this.listenTo(this.model, "sync", this.render);
		console.log(this.model);
	},
	
	template: JST['courses/new'],
	
	render: function() {
		var content = this.template({});
		
		this.$el.html(content);
		
		return this;
	},
	
	events: {
		"click submit": "submitCourse",
	},
	
	submitCourse: function(event) {
		console.log("submitting...")
		event.preventDefault();
		var params = $(event.target).serializeJSON();
		var title = params["course"]["title"];
		var category = params["course"]["category"];
		var newCourse = new Memgrow.Models.Course({ 
			title: title,
			category: category,
			author_id: this.model.get("id")
		});
		
		console.log(newCourse);
		
    newCourse.save({}, {
      success: function () {
        App.Collections.userCourses.add(newCourse);
        Backbone.history.navigate("#", { trigger: true });
      }
    });
	}
});