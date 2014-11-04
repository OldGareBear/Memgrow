Memgrow.Collections.UserCardHistories = Backbone.Collection.extend({
  url: "/api/user_card_histories",

  model: Memgrow.Models.UserCardHistory,

  getOrFetch: function(id) {
    var histories = this;
    var history = histories.get(id);

    if (history) {
      history.fetch();
    } else {
      history = new Memgrow.Models.UserCardHistory({
        id: id
      });
      history.fetch({
        success: function() {
          histories.history(course)
        }
      });
    }

    return history;
  }
});
