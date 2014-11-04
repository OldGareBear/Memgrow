Memgrow.Views.StudySesh = Backbone.View.extend({
  initialize: function(options) {
    this.cards = options.cards;
    this.current_user = options.current_user
  },

  template: JST['courses/show'],

  render: function() {
    var content = this.template({
      cards: this.cards
    });
  },




});
