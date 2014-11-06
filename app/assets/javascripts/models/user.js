Memgrow.Models.User = Backbone.Model.extend({
	url: "/api/dashboard",

	parse: function(jsonResp) {
		if (jsonResp.courses) {
			this.courses().set(jsonResp.courses, { parse: true });
      delete jsonResp.courses;
		}

    if (jsonResp.friends) {
      this.friends().set(jsonResp.friends, { parse: true });
      delete jsonResp.friends;
    }

    if (jsonResp.leaders) {
      this.leaders().set(jsonResp.leaders, { parse: true });
      delete jsonResp.leaders;
    }

		if (jsonResp.user_card_histories) {
			this.userCardHistories().set(
				jsonResp.user_card_histories,
				{ parse: true }
			);
			delete jsonResp.user_card_histories;
		}

		return jsonResp;
	},

	courses: function() {
		if (!this._courses) {
			this._courses = new Memgrow.Collections.UserCourses([], {});
		}
		return this._courses
	},

  friends: function() {
    if (!this._friends) {
      this._friends = new Memgrow.Collections.Friends([], {});
    }
    return this._friends;
  },

  leaders: function() {
    if (!this._leaders) {
      this._leaders = new Memgrow.Collections.Leaders([], {});
    }
    return this._leaders;
  },

	userCardHistories: function() {
		if (!this._userCardHistories) {
			this._userCardHistories = new Memgrow.Collections.UserCardHistories([], {});
		}
		return this._userCardHistories;
	},

	saveUser: function(event) {
		console.log(event.fpfile);
		this.save({ filepicker_url: event.fpfile["url"] });
	}
});

Memgrow.Models.user = new Memgrow.Models.User;








// scroll past
