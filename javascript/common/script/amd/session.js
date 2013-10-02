define(function() {

  'use strict';

	var _users = [];

	return {
    addUser: function(user) {
      if(!this.findUserById(user.id)) {
        _users[_users.length] = user;
      }
      return user;
    },
		findUserById: function(userId) {
      var index = _users.length,
          user;
      while(--index > -1) {
        user = _users[index];
        if(user.id === userId) {
          return user;
        }
      }
      return undefined;
    },
    getUsers: function() {
      return _users;
    },
    clearUsers: function() {
      _users.length = 0;
      return _users;
    }
	};

});