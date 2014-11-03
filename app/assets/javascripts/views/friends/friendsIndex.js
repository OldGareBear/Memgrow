Memgrow.Views.FriendsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync remove", this.render)
  },

  template: JST["friends/index"],

  className: "friends-index",

  render: function() {
    var content = this.template({
      friends: this.collection
    });

    this.$el.html(content);

    return this;
  }
});