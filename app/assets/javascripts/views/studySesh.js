Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {	
		this.current_card = 0;	
    this.cards = options.cards;
    this.current_user = options.current_user
  },

  template: JST['cards/showCard'],

  render: function() {
		console.log(this.cards);
		console.log(this.current_card);
		var card = this.cards[this.current_card];
		
    var content = this.template({
			current_user: this.current_user,
      card: card
    });
		
		this.$el.html(content);
		
		return this;
  },

	events: {
		"click button submit": "nextCard"
	},

	nextCard: function(event) {
		event.preventDefault();
		this.current_card += 1;
		
		this.render();
	}
});
