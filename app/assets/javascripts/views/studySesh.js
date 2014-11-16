Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {
		this.currentCard = 0; 
    this.cards = options.cards;
		// not adjustable so that currentCard index can be modded in render
		this.courseLength = this.cards.length;
    this.currentUser = options.currentUser;
    this.histories = this.currentUser.userCardHistories()

		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.currentUser, "sync", this.render);
    this.listenTo(this.histories, "sync", this.render);
  },

  template: JST['cards/show'],

  render: function() {
		console.log("the due cards for this particular deck in the study sesh ", this.cards);

		var card = this.cards[this.currentCard];

    var content = this.template({
			currentUser: this.currentUser,
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

    this.evaluateAnswer(event, this.currentCard);

    if ((this.currentCard + 1) === this.courseLength) { //not sure why +1
      Backbone.history.navigate("#", { trigger: true });
    } else {
      this.currentCard += 1;
      this.render();
    }
	},

  evaluateAnswer: function(event, card_index) {
    var params = $(event.target).serializeJSON();
    var pinyin_answer = params["answer"]["pinyin"];
    var english_answer = params["answer"]["english"];

		var currentCard = this.cards[card_index];

    var cardHistory = this.histories.findWhere({
      card_id: parseInt(currentCard.escape("id"))
    });

    // find out whether the user was correct or not
    if (pinyin_answer === currentCard.get("pinyin") &&
        english_answer === currentCard.get("english")) {
				handleCorrectGuess(cardHistory);
    } else { 
			setTimeout(handleWrongGuess.bind(this, cardHistory), 500);
			wrongGuessdisplay();
  },
	
	wrongGuessDisplay: function() {
		console.log("Now you f***d up!")
	},
	
	handleCorrectGuess: function() {
    // increment the user's points for a correct answer
    var newPoints = this.currentUser.get("points") + 1
    console.log(newPoints);

    this.currentUser.set({ points: newPoints });

    var that = this
    this.currentUser.save({}, {
      success: function() {
        console.log(that.currentUser)
      }
    });

    // update the user card history for the current user and current card
    cardHistory.set({
      times_right: cardHistory.get("times_right") + 1,
			times_right_since_last_mistake: cardHistory.get("times_right_since_last_mistake") + 1,
      last_studied: new Date()
    });
		
	},
	
	handleWrongGuess: function() {
		// push the current card to the end of the session and increment the
		// courseLength so the study session doesn't end prematurely
		this.cards.push(currentCard);
		this.courseLength += 1;
		
    // update the user card history for the current user and current card
     cardHistory.set({ 
			 times_wrong: cardHistory.get("times_wrong") + 1,
			 times_right_since_last_mistake: 0
		 });
  }

  cardHistory.save({});
	}
});






















// end
