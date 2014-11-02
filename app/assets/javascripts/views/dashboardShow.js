Memgrow.Views.DashboardShow = Backbone.View.extend({
	template: JST['dashboard/show'],
	
	className: 'user-show',
	
	render: function() {
		console.log(this.model)
		content = this.template({ 
			current_user: this.model 
		});
		this.$el.html(content);
		return this;
	}
	
});