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
		
		console.log(currentUser);
		console.log("currentUser.userCardHistories()", currentUser.userCardHistories());
		console.log("this.cards()", this.cards());
		
		this.cards().each(function(card) {
			console.log("current card", card);
			console.log("current card's id", card.get("id"));
			console.log("card histories for currentUser", currentUser.userCardHistories());
			
			
			var cardHistory = currentUser.userCardHistories().findWhere({ card_id: card.get("id") });
			
			console.log("card history successfully retrieved:", cardHistory);
			
			if (cardHistory.get("due?"))
			_dueCards.push(card);
		});
		
		console.log("the return value; and array of due cards", _dueCards);
		return _dueCards;
	}
})