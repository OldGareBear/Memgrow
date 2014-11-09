Memgrow.Views.CoursesIndex = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.model, "sync", this.render);
	},
	
	template: JST['courses/index'],
	
	render: function() {
		var categories = [];
		
		this.collection.each(function(course) {
			categories.push(course.escape("category"));
		});
		
		
		categories = this.myUniq(categories);
		
		var content = this.template({
			courses: this.collection,
			categories: categories,
			current_user: this.model
		});
		
		this.$el.html(content);
		
		return this;
	},
	
	myUniq: function(array) {
		var new_array = [];
		array.forEach(function(el) {
			if(!_.contains(new_array, el)) {
				new_array.push(el);
			}
		});
		
		return new_array;
	},
	
	events: {
		"submit": "submit"
	},
	
	submit: function(event) {
		event.preventDefault();
		
		var course_id = $(event.target).serializeJSON()["enrollment"];
		
		console.log(course_id);
		
    $.ajax({
      type: "POST",
      url: "api/enrollments",
      data: course_id,
      success: function(results) {
        console.log("your course has been added!")
      }
    });
	}
});