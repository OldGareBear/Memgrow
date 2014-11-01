Memgrow.Models.User = Backbone.Model.extend({
	urlRoot: "/api/users",
	
	parse: function(jsonResp) {
		if (jsonResp.courses) {
			this.courses().set(jsonResp.courses, { parse: true });
			delete jsonResp.courses;
		}

		return jsonResp;
	},

	courses: function() {
		if (!this._courses) {
			// will have to build new collection for UserCourses
			this._courses = new Memgrow.Collections.UserCourses([], {
				user: this
			});
		}
		return this._courses
	}
});

Memgrow.Models.user = Memgrow.Models.User