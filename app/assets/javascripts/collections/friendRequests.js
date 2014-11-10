Memgrow.Collections.FriendRequests = Backbone.Collection.extend({
	url: '/api/friendships',

	model: Memgrow.Models.Friendship
});
