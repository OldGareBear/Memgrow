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
    if ((this.current_card + 1) === this.course_length) {
      Backbone.history.navigate("#", { trigger: true });
    } else {
      this.current_card += 1;
      this.render();
    }
	}
});
