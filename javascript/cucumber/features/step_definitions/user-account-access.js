var expect = require('chai').expect,
    jq = require('jquery');

module.exports = function() {

  'use strict';

  var userOneFromSession;

  this.World = require('../support/world.js').World;

  // User Accounts Accessible
  this.Given(/^I am an administrator$/, function(callback) {
    this.logInAsAdministrator(callback);
  });

  this.When(/^I request all user accounts$/, function(callback) {
    this.loadUsers(callback);
  });

  this.Then(/^the Session model is updated with received User models$/, function(callback) {
    expect(this.session.getUsers().length).to.equal(2);
    callback();
  });

  // User Account Properties Accessible
  this.Given(/^User accounts are available on the Session model$/, function(callback) {
    this.loadUsers(callback);
  });

  this.When(/^I access User from the list$/, function(callback) {
    userOneFromSession = this.session.findUserById(this.userOneId);
    callback();
  });

  this.Then(/^I can view that User's account details$/, function(callback) {
    expect(userOneFromSession).to.not.be.an('undefined');
    expect(userOneFromSession).to.have.property('id');
    expect(userOneFromSession).to.have.property('name');
    callback();
  });

};