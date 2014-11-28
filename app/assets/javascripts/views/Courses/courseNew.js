Memgrow.Views.CourseNew = Backbone.View.extend({
	intitialize: function() {
		this.listenTo(this.model, "sync", this.render);
		this.listentTo(this.collection, "sync", this.render); // probably not necessary
	},

	template: JST['courses/new'],

	render: function() {
		var content = this.template({});

		this.$el.html(content);

		var $filePickerInput = this.$("input[type=filepicker]");
		
		filepicker.constructWidget($filePickerInput[0]);

		return this;
	},

	events: {
		"submit": "submitCourse",
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

		var courses = this.collection
		
		that = this;
    newCourse.save({}, {
      success: function (response) {
        courses.add(newCourse);
        Backbone.history.navigate("#/cards/new", { trigger: true });
      }
    });
	}
});
