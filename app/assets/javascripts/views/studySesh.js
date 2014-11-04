Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {
		this.current_card = 0;
    this.cards = options.cards;
		this.course_length = this.cards.length;
    this.current_user = options.current_user;
    this.histories = this.current_user.userCardHistories()

		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.current_user, "sync", this.render);
    this.listenTo(this.histories, "sync", this.render);
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

    this.evaluateAnswer(event, this.current_card);

    if ((this.current_card + 1) === this.course_length) { //not sure why +1
      Backbone.history.navigate("#", { trigger: true });
    } else {
      this.current_card += 1;
      this.render();
    }
	},

  evaluateAnswer: function(event, card_index) {
    var params = $(event.target).serializeJSON();
    var pinyin_answer = params["answer"]["pinyin"];
    var english_answer = params["answer"]["english"];
    console.log(english_answer);
    var current_card = this.cards.models[card_index];

    console.log("user_id:" + this.current_user.escape("id"));
    console.log("card_id:" + current_card.escape("id"));

    var history = this.histories.findWhere({
      card_id: parseInt(current_card.escape("id")) 
    });

    console.log(this.histories)
    console.log(history);

    // find out whether the user was correct or not
    if (pinyin_answer === current_card.get("pinyin") &&
        english_answer === current_card.get("english")) {

      // increment the user's points for a correct answer
      this.current_user.set({ points: this.current_user.get("points") + 1 });
      this.current_user.save({});

      // update the user card history for the current user and current card
      history.set({
        times_right: history.get("times_right" + 1),
        last_studied: new Date()
      });

    } else {
      // update the user card history for the current user and current card
       history.set({ times_wrong: history.get("times_wrong" + 1) });
    }

    history.save({});
  },
});






















// end
