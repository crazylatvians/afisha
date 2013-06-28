//= require jquery
//= require jquery_ujs
//= require select2
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require afisha
Afisha = Ember.Application.create();

$(function() {
  $(".chzn-select").select2();
});