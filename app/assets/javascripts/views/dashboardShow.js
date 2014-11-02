Memgrow.Views.DashboardShow = Backbone.View.extend({
	
	template: JST["dashboard/show"],
	
	render: function() {
		console.log(this.model.get("username"))
		content = this.template({ 
			current_user: this.model 
		});
		this.$el.html(content);
		return this;
	}
	
});