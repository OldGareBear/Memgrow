Memgrow.Collections.Courses = Backbone.Collection.extend({
	url: 'api/courses',
	
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

Memgrow.Collections.courses = new Memgrow.Collections.Courses;