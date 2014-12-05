Memgrow.Collections.UserCourses = Backbone.Collection.extend({
	url: "/api/courses",

	model: Memgrow.Models.Course,

  getOrFetch: function(id) {
    var courses = this;
    var course = courses.get(id);

    if (course) {
      course.fetch();
    } else {
      course = new Memgrow.Models.Course({
        id: id
      });
      course.fetch({
        success: function() {
          courses.add(course)
        }
      });
    }

    return course;
  },

	has: function(model) {
		var allIds = this.pluck("id");
		allIds.contains(model.get("id"))
	}
});

// Memgrow.Collections.userCourses = new Memgrow.Collections.UserCourses;
