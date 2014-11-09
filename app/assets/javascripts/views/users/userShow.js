Memgrow.Views.UserShow = Backbone.View.extend({
	initialize: function() {
		this.currentUser = Memgrow.Models.user;
		this.currentUser.fetch();
		
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model, "sync", this.render);
	},
	
	template: JST["users/show"],
	
	render: function() {
		console.log(this.model);
		var leaders = this.generateLeaders();
		
		var content = this.template({
			user: this.model,
			currentUser: this.currentUser,
			leaders: leaders
		});
		
		this.$el.html(content);
		
		return this;
	},
	
  generateLeaders: function() {
    var leaders = this.model.friends().clone();
    leaders.add(this.model);
    leaders = leaders.sortBy(function(leader) { return -leader.get("points"); });
    leaders = leaders.slice(0, 10);
    return leaders;
  },
})