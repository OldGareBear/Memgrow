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
		"click submit_course": "submitCourse",
		"click create_card": "addCard"
	},
	
	submitCourse: function(event) {
		event.preventDefault();
		var params = $(event.target).serializeJSON();
		var title = params["course"]["title"];
		var category = params["course"]["category"];
		var newCourse = new Memgrow.Models.Course({ 
			title: title,
			category: category,
			author_id: this.model.get("id")
		});
		
		newCourse.save({});
	}
});