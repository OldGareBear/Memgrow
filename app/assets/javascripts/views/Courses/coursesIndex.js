Memgrow.Views.CoursesIndex = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, "sync", this.render);
	},
	
	template: JST['courses/index'],
	
	render: function() {
		var content = this.template({
			courses: this.collection
		});
		
		this.$el.html(content);
		
		return this;
	}
});