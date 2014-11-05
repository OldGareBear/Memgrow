Memgrow.Views.NewCard = Backbone.View.extend({
	template: 'cards/new',
	
	render: function() {
		var content = this.template({
			course: this.model
		});
		
		this.$el.html(content);
		
		return this;
	}
});