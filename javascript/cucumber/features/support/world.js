/*global process:true requirejs:true*/
var requirejs = require('requirejs'),
    $ = require('jquery');

requirejs.config({
  baseUrl: '.',
  paths: {
    'script': process.cwd() + '/common/script/amd',
    'jquery': $
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
  $.ajax = function() {
    var def = $.Deferred();
    def.resolveWith(null, [JSON.stringify([])]);
    return $.Deferred();
  }
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