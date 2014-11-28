Memgrow.Views.CoursesIndex = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.model, "sync", this.render);
		
		this.currentCategory = this.collection;
	},
	
	template: JST['courses/index'],
	
	render: function() {
		var categories = [];

		this.collection.forEach(function(course) {
			categories.push(course.escape("category"));
		});
		var categories = this.myUniq(categories);
		
		var content = this.template({
			courses: this.currentCategory,
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
		"submit": "submit",
		"click li.category": "filterByCategory"
	},
	
	submit: function(event) {
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
	
	filterByCategory: function(event) {
		var category = $(event.currentTarget).text();
		this.currentCategory = this.collection.where({category: category});
		this.render();
	}
});