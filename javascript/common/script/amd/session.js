define(function() {

	var _users = [];

	return {
    addUser: function(user) {
      if(!this.getUserById(user.id)) {
        _users[_users.length] = user;
      }
      return user;
    },
		findUserById: function(userId) {
      var index = this.getUserIndexById(userId);
      if(index > -1) {
        return _users[index];
      }
      return undefined;
    },
    getUsers: function() {
      return _users;
    }
	};

});