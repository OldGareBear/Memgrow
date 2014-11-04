Memgrow.Collections.UserCardHistories = Backbone.Collection.extend({
  url: "/api/user_card_histories",

  model: Memgrow.Models.UserCardHistory
});
