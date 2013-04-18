define(function() {
  
  return {
    create: function(id) {
      var newUser = Object.create(user);
      Object.defineProperties(newUser, {
        "id": {
          value: id,
          writable: false,
          enumerable: true
        },
        "name": {
          value: undefined,
          writable: true,
          enumerable: true
        }
      });
      return newUser;
    }
  };

});