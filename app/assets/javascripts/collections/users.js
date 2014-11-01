// Memgrow.Collections.Users = Backbone.Collection.extend({
// 	url: "/api/users",
//
// 	model: Memgrow.Models.User,
//
// 	getOrFetch: function(id) {
// 		var users = this;
// 		var user = this.get(id);
//
// 		if (user) {
// 			user.fetch();
// 		} else {
// 			user = new Memgrow.Models.User({ id: id })
// 			user.fetch({
// 				success: function() {
// 					users.add(user);
// 				}
// 			});
// 		}
//
// 		return user
// 	}
// });
//
// Memgrow.Collections.users = Memgrow.Collections.Users();