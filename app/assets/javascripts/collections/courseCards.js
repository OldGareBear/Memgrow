Memgrow.Collections.CourseCards = Backbone.Collection.extend({
	model: Memgrow.Models.Card,

	url: function() {
		return this.course.url() + "/cards"
	},

	initialize: function(models, options) {
		this.course = options.course;
	}
});