Memgrow.Views.UserShow = Backbone.View.extend({
	// initialize: function() {
	// 	this.listenTo(this.model, "sync", this.render);
	// },
	
	template: JST["users/show"],
	
	render: function() {
		console.log(this.model)
		content = this.template({ user: this.model });
		this.$el.html(content);
		return this;
	}
	
});