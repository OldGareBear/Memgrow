Memgrow.Views.UserShow = Backbone.View.extend({
	tagName: "ul",
	
	template: JST["users/show"],
	
	render: function() {
		content = this.template({ user: this.model });
		this.$el.html(content);
		return this;
	}
	
});