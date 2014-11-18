Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {
		this.currentCard = 0; 
    this.cards = options.cards;
		this.courseLength = this.cards.length;
    this.currentUser = options.currentUser;
    this.histories = this.currentUser.userCardHistories()

		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.currentUser, "sync", this.render);
    // this.listenTo(this.histories, "sync", this.render);
  },

  template: JST['cards/show'],

  render: function() {
		// console.log("due cards", this.cards);
		// console.log("current card", this.currentCard);

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
    // console.log("next card")
		event.preventDefault();

    this.evaluateAnswer(event, this.currentCard);
		// check whether we have reviewed all due cards
    if ((this.currentCard + 1) === this.courseLength) { 
      Backbone.history.navigate("#", { trigger: true });
    } else {
      this.currentCard += 1;
			// set timeout so that user can see answer feedback
			that = this;
			setTimeout(function(){
				that.render();
			}, 500)
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
		// disregard case and pinyin spacing
		
    if (pinyin_answer.toLowerCase().replace(/\s/g,'') ===
			currentCard.get("pinyin").toLowerCase().replace(/\s/g,'') &&
			
      english_answer.toLowerCase() === currentCard.get("english").toLowerCase()) {
			
				this.handleCorrectGuess(cardHistory);
    } else { 
			this.handleWrongGuess(cardHistory, currentCard);
		}
  },
	
	handleWrongGuess: function(cardHistory, currentCard) {
		// push the current card to the end of the session and increment the
		// courseLength so the study session doesn't end prematurely
		this.cards.push(currentCard);
		this.courseLength += 1;

    // update the user card history for the current user and current card
    cardHistory.set({ 
		 times_wrong: cardHistory.get("times_wrong") + 1,
		 times_right_since_last_mistake: 0
		});

		cardHistory.save({});
		$("form.card-quiz").addClass("wrong");
	},
	
	handleCorrectGuess: function(cardHistory) {
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
		
		cardHistory.save({});
		
		$("form.card-quiz").addClass("correct");
	}
});






















// end
