Memgrow.Views.CardsNew = Backbone.View.extend({
	template: JST['cards/new'],

	render: function() {
		var content = this.template({
			course: this.model
		});

		this.$el.html(content);

		return this;
	},

	events: {
		"submit": "addCard"
	},

	addCard: function(event) {
		event.preventDefault();
		var params = $(event.target).serializeJSON();
		var character = params["card"]["character"];
		var pinyin = params["card"]["pinyin"];
		var english = params["card"]["english"];

		var newCard = new Memgrow.Models.Card({
			character: character,
			pinyin: pinyin,
			english: english,
			course_id: this.model.get("id")
		});

		var that = this;

		newCard.save({}, {
			success: function() {
				console.log("card saved")
				// append the next card form onto the bottom of the old one
				that.appendSubform()
			}
		});
	},

	appendSubform: function() {
		$("div.new-card").append(JST['cards/subForm'])
	}
});












//scroll past bottom
