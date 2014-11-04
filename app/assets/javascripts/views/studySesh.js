Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {
		this.current_card = 0;
    this.cards = options.cards;
		this.course_length = this.cards.length;
    this.current_user = options.current_user;

		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.current_user, "sync", this.render);
  },

  template: JST['cards/showCard'],

  render: function() {

		var card = this.cards.models[this.current_card];

    var content = this.template({
			current_user: this.current_user,
      card: card
    });

		this.$el.html(content);

		return this;
  },

	events: {
		"submit": "nextCard"
	},

	nextCard: function(event) {
    console.log("next card")
		event.preventDefault();

    evaluate_answer(event, this.current_card);

    if ((this.current_card + 1) === this.course_length) { //not sure why +1
      Backbone.history.navigate("#", { trigger: true });
    } else {
      this.current_card += 1;
      this.render();
    }
	},

  evaluate_answer: function(event, card_index) {
    var params = $(event.currentTarget).serializeJSON();
    var pinyin_answer = params["answer"]["pinyin"];
    var english_answer = params["answer"]["english"];
    var current_card = this.cards.models[card_index];

    var history = this.current_user.userCardHistories.findWhere({
      user_id: this.current_user.escape("id"),
      card_id: current_card.escape("id")
    });

    // find out whether the user was correct or not
    if (pinyin_answer === current_card.get("pinyin") &&
        english_answer === current_card.get("english")) {

      // increment the user's points for a correct answer
      var user_points = this.current_user.get("points");
      this.current_user.set({ points: user_points + 1 });
      this.current_user.save({});

      // update the user card history for the current user and current card


    } else {

    }

  },
});






















// end
