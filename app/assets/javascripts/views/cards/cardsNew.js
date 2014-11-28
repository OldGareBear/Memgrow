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
		"submit": "addCard",
		"click div.finish-cards": "enrollAuthor"
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
		
		var submitButton = this.$("input[type='submit']")[0];
		var placeholder = $("<div>")
		placeholder.addClass("submit-card-placeholder");
		
		// stop the old card info from moving off-center
		submitButton.remove();
		$(event.target).append(placeholder);

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
	},
	
	enrollAuthor: function() {
		console.log("hello");
		$.ajax({
			type: "POST",
			url: "api/enrollments",
			data: { "course_id": this.model.id },
			success: function() {
				Backbone.history.navigate("#", { trigger: true });
			}
		});
	}
});












//scroll past bottom
