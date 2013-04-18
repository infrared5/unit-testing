define(['module'], function(module) {

  var endpoint = module.config().endpoint;

  return {
    getUsers: function() {
      return $.ajax({
        url: endpoint + '/users',
        dataType: 'json'
      });
    },
    addUser: function(value) {
      return $.ajax({
        url: endpoint + '/users/' + value.id,
        contentType: 'application/json',
        data: JSON.stringify(value),
        dataType: 'json'
      });
    }
  };

});