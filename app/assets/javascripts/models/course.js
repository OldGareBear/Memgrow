Memgrow.Models.Course = Backbone.Model.extend({
	urlRoot: "/api/courses",

	parse: function(jsonResp) {
		if (jsonResp.cards) {
			this.cards().set(jsonResp.cards, { parse: true })
      delete jsonResp.cards
		}

		return jsonResp;
	},

	cards: function() {
		if (!this._cards) {
			this._cards = new Memgrow.Collections.CourseCards([], {
				course: this
			});
		}

		return this._cards
	}
})