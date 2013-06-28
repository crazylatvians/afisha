Afisha.Router.map(function() {
	this.resource('events', function(){
		this.resource('event', {path: ':event_id'});
	}); // '/#/events' 
});

Afisha.EventsRoute = Ember.Route.extend({
  model: function() {
    return Afisha.Event.find();
  }
});
