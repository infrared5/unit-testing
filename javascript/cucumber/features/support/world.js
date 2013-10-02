/*global process:true requirejs:true*/
var requirejs = require('requirejs'),
    jq = require('jquery'),
    session,
    userFactory,
    getUsersCommand;

requirejs.config({
  baseUrl: '.',
  paths: {
    'script': process.cwd() + '/common/script/amd',
    'jquery': jq
  },
  config: {
    'script/user-service': {
      endpoint: 'http://localhost:3001'
    }
  }
});

session = requirejs('script/session'),
userFactory = requirejs('script/user-factory'),
getUsersCommand = requirejs('script/get-users-command');

var World = function World(callback) {

  'use strict';

  this.userOneId = '1234';
  this.userTwoId = '5678';
  this.session = session;
  this.userFactory = userFactory;
  this.usersToAdd = [this.userFactory.create(this.userOneId), this.userFactory.create(this.userTwoId)];

  (function(world) {
    jq.ajax = function() {
      var def = jq.Deferred();
      def.resolveWith(null, [JSON.stringify(world.usersToAdd)]);
      return def;
    };
  }(this));

  callback();
};

World.prototype.logInAsAdministrator = function(callback) {
  'use strict';
  callback();
};

World.prototype.loadUsers = function(callback) {
  'use strict';
  getUsersCommand.execute(function(userList) {
    callback();
  });
};

module.exports.World = World;