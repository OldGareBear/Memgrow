Memgrow.Collections.UserCourses = Backbone.Collection.extend({
  initialize: function(models, options) {
    // this.user = options.user
  },

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
  }
});

// Memgrow.Collections.userCourses = new Memgrow.Collections.UserCourses;
