Memgrow.Collections.UserCourses = Backbone.Collection.extend({
  initialize: function(models, options) {
  	this.user = options.user
  },
	
	url: function() {
		return this.user.url() + "/courses"
	},
	
	model: Memgrow.Models.Course
});