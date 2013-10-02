var expect = require('chai').expect,
    jq = require('jquery');

module.exports = function() {

  'use strict';

  var newuser,
      newuserId = 'foo';

  this.World = require('../support/world.js').World;

  // User Account Add
  this.Given(/^I am an administrator$/, function(callback) {
    this.logInAsAdministrator(callback);
  });

  this.When(/^I request to add a user$/, function(callback) {
    this.loadUsers(callback);
  });

  // > with Unique ID Added
  this.When(/^The user id is not available in the system$/, function(callback) {
    newuser = this.userFactory.create(newuserId);
    this.session.addUser(newuser);
    callback();
  });

  this.Then(/^The Session model is updated with the User account added$/, function(callback) {
    expect(this.session.getUsers().length).to.equal(3);
    expect(this.session.findUserById(newuserId)).to.not.be.an('undefined');
    callback();
  });

  // > with Non-Unique Not Added
  this.When(/^The user id is already existant in the system$/, function(callback) {
    this.session.addUser(this.userFactory.create(this.userOneId));
    callback();
  });

  this.Then(/^The Session model is unaffected$/, function(callback) {
    expect(this.session.getUsers().length).to.equal(2);
    callback();
  });

};