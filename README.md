== README

##Memgrow

Memgrow is a social Mandarin Chinese-learning web application hosted live at memgrow.herokuapp.com. 

Memgrow is supported by a Ruby on Rails (-v 4.0.2) backend and a Backbone.js frontend. 

####Noteworthy features

* Study sessions
* Friend requests/confirmation
* User search


##### Study sessions

Study sessoins are at the heart of Memgrow's functionality. When users select a course to study, they iterate through the cardShow templates for each card in the course. When users submit their answers to each card, the user's card-specific and user-level statistics are updated. The fact that users have many courses, courses have many cards, and cards have one author led to some interesting overriding of Backbone's parse function. 

##### Friend requests/confirmation

Memgrow's user model is greatly complicated by the fact that user's have complex a complex relationship with the friend requests table. A user can be the requester or the requestee of a friendship, and the friendship's status can be "pending", "accepted", or "declined". So essentially, a user can have 6 different types of "friendships", and each type of user-friendship relationship exhibits different behaviors in the frontend.

##### User search

Searching for users was greatly simplified by using the pg-search gem, but there were still interesting questions left open. I wrote a custom static_pages#search route to which I directed search queries via an Ajax request in the dashboardShow view. I render the results of the Ajax request in the same view. 

* Model tests written in RSpec


