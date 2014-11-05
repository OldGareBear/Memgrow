Memgrow.Views.CourseNew = Backbone.View.extend({
	intitialize: function() {
		this.listenTo(this.model, "sync", this.render);
		this.listentTo(this.collection, "sync", this.render); // probably not necessary
	},
	
	template: JST['courses/new'],
	
	render: function() {
		var content = this.template({});
		
		this.$el.html(content);
		
		return this;
	},
	
	events: {
		"submit": "submitCourse",
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
		
		var courses = this.collection
		
		console.log(this.collection);
		
    newCourse.save({}, {
      success: function () {
        courses.add(newCourse);
        Backbone.history.navigate("#/cards/new", { trigger: true });
      }
    });
	}
});