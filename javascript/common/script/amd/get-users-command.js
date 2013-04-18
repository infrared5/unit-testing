define(['src/session', 'src/user-service'], function(session, userService) {
  
  return {
    execute: function(success, fault) {
      userService
        .getUsers()
        .done(function(usersJSON) {
          var users = JSON.parse(usersJSON);
          while(users.length > 0) {
            session.addUser(users.shift());
          }
          success.call(null, session.getUsers());
        })
        .fail(function(xhr, message) {
          fault.call(null, message);
        });
    }
  };

});