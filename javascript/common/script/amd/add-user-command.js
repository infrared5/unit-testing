define(['script/session', 'script/user-service'], function(session, userService) {

  var _user;  

  return {
    setUser: function(value) {
      _user = value;
      return this;
    },
    execute: function(success, fault) {
      userService
        .addUser(_user)
        .done(function(responseJSON) {
          var isAdded = JSON.parse(responseJSON).isAdded;
          if(isAdded) {
            session.addUser(_user);
            success.call(null, true);
          }
          else {
            fault.call(null, 'Could not add user.');
          }
        })
        .fail(function(xhr, message) {
          fault.call(null, message);
        })
        .always(function() {
          _user = undefined;
        });
    }
  };

});