Memgrow.Models.Course = Backbone.Model.extend({
	urlRoot: "/api/courses",

	parse: function(jsonResp) {
		if (jsonResp.cards) {
			this.cards().set(jsonResp.cards, { parse: true });
      delete jsonResp.cards
		}
		
		if (jsonResp.comments) {
			this.comments().set(jsonResp.comments, { parse: true });			
			delete jsonResp.comments
		}

		return jsonResp;
	},

	cards: function() {
		if (!this._cards) {
			this._cards = new Memgrow.Collections.CourseCards([], {
				course: this
			});
		}

		return this._cards;
	},
	
	comments: function() {
		if (!this._comments) {
			this._comments = new Memgrow.Collections.Comments([], {
				course_id: this.id
			});
		}
		
		return this._comments;
	},
	
	dueCards: function(currentUser) {
		var _dueCards = [];
		

		
		this.cards().each(function(card) {

			var cardHistory = currentUser.userCardHistories().findWhere({ card_id: card.get("id") });
			
			if (cardHistory.get("due?"))
			_dueCards.push(card);
		});

		return _dueCards;
	}
})