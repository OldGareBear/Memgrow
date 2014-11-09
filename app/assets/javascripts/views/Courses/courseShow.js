Memgrow.Views.CourseShow = Backbone.View.extend({
	initialize: function(options) {
		this.currentUser = options.currentUser;
		
		this.listenTo(this.model, "sync", this.render)
		this.listenTo(this.currentUser, "sync", this.render)
	},
	
	template: JST["courses/show"],
	
	render: function() {
		var cards = this.model.cards();
		var comments = this.model.comments();
		
		var content = this.template({
			course: this.model,
			cards: cards,
			currentUser: this.currentUser,
			comments: comments
		});
		
		this.$el.html(content);
		
		return this;
	}
});