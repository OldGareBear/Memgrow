Memgrow.Model.User = Backbone.Model.extend({
	urlRoot: "/api/users",
	
	parse: function(jsonResp) {
		if (jsonResp.courses) {
			this.courses().set(jsonResp.courses;
			delete jsonResp.courses;
		}
		
		return jsonResp;
	},
	
	courses: function() {
		if (!this._courses) {
			this._courses = new Memgrow. Collections.UserCourses([], {
				user: this
			});
		}
		return this._courses
	}
});