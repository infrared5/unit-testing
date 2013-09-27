/*global process:true requirejs:true*/
var requirejs = require('requirejs'),
    jq = require('jquery');

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

var session = requirejs(process.cwd() + '/common/script/amd/session.js'),
    getUsersCommand = requirejs(process.cwd() + '/common/script/amd/get-users-command.js');

var World = function World(callback) {

  'use strict';

  this.session = session;
  jq.ajax = function() {
    var def = jq.Deferred();
    def.resolveWith(null, [JSON.stringify([])]);
    return jq.Deferred();
  };
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