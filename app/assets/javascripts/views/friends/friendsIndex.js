Memgrow.Views.FriendsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "sync remove", this.render)
  },

  template: JST["friends/index"],

  className: "friends-index",

  render: function() {
    var friends = this.model.friends();

    var content = this.template({
      friends: friends
    });

    this.$el.html(content);

    return this;
  }
});
