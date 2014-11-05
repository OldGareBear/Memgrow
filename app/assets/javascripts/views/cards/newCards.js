Memgrow.Views.CardsNew = Backbone.View.extend({
	template: JST['cards/new'],
	
	render: function() {
		var content = this.template({
			course: this.model
		});
		
		this.$el.html(content);
		
		return this;
	}
});