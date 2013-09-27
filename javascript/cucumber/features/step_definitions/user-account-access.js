var assert = require('assert');
module.exports = function() {

  'use strict';

  var users = [];

  this.World = require('../support/world.js').World;

  this.Given(/^I am an administrator$/, function(callback) {
    this.logInAsAdministrator(callback);
  });

  this.When(/^I request all user accounts$/, function(callback) {
    this.loadUsers(callback);
  });

  this.Then(/^the Session model is updated with received User models$/, function(callback) {
    assert.not.equal(this.session.getUsers(), users);
    callback();
  });

};