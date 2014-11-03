Memgrow.Views.DashboardShow = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

	template: JST['dashboard/show'],

	className: 'user-show',

	render: function() {
		console.log(this.model)
		content = this.template({
			current_user: this.model
      // courses: this.collection
		});
		this.$el.html(content);
		return this;
	}

});