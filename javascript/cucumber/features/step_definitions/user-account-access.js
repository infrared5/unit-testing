var expect = require('chai').expect,
    jq = require('jquery');

module.exports = function() {

  'use strict';

  var users,
      userOneId = '1234',
      userTwoId = '5678';

  jq.ajax = function() {
    var def = jq.Deferred();
    def.resolveWith(null, [JSON.stringify(users)]);
    return def;
  };

  this.World = require('../support/world.js').World;

  this.Given(/^I am an administrator$/, function(callback) {
    this.logInAsAdministrator(callback);
  });

  this.When(/^I request all user accounts$/, function(callback) {
    users = [this.userFactory.create(userOneId), this.userFactory.create(userTwoId)];
    this.loadUsers(callback);
  });

  this.Then(/^the Session model is updated with received User models$/, function(callback) {
    expect(this.session.getUsers().length).to.equal(users.length);
    expect(this.session.getUsers()[0].id).to.equal(users[0].id);
    callback();
  });

};