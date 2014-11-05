Memgrow.Views.UserSearchResults = Backbone.View.extend({
  initialize: function(options) {
    this.results = options.results;
  },

  className: "search-results",

  template: JST['userSearchResults'],

  render: function() {
    console.log("this is what's getting passed to the template:", this.results);
    var content = this.template({
      users: this.results
    });

    this.$el.html(content);

    return this;
  }
})
