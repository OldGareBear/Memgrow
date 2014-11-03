Memgrow.Collections.UserCourses = Backbone.Collection.extend({
  initialize: function(models, options) {
    // this.user = options.user
  },

	url: "/api/courses",

	model: Memgrow.Models.Course,

  getOrFetch: function(id) {
    
  }
});

// Memgrow.Collections.userCourses = new Memgrow.Collections.UserCourses;
