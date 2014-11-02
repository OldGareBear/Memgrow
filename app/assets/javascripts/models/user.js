Memgrow.Models.User = Backbone.Model.extend({
	url: "/api/dashboard",
	
	parse: function(jsonResp) {
		if (jsonResp.courses) {
			this.courses().set(jsonResp.courses, { parse: true });
			delete jsonResp.courses;
		}

		return jsonResp;
	},

	courses: function() {
		if (!this._courses) {
			this._courses = new Memgrow.Collections.UserCourses([], {
				user: this
			});
		}
		return this._courses
	}// ,
//
// 	userCardHistories: function() {
//
// 	}
});

Memgrow.Models.user = new Memgrow.Models.User