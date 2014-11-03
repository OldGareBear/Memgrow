Memgrow.Collections.Friends = Backbone.Collection.extend({
  url: "/api/users",

  model: Memgrow.Models.OtherUser
});