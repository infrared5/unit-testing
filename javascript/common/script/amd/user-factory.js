define(function() {

  'use strict';
  
  return {
    create: function(id) {
      var newUser = Object.create(Object.prototype);
      Object.defineProperties(newUser, {
        'id': {
          value: id,
          writable: false,
          enumerable: true
        },
        'name': {
          value: '',
          writable: true,
          enumerable: true
        }
      });
      return newUser;
    }
  };

});