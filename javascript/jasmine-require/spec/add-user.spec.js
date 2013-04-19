/*global $:false*/
define(['script/session', 'script/add-user-command', 'script/user-factory'],
        function(session, addUserCommand, userFactory) {

  describe('add user', function() {

    describe('add request of non-existing user', function() {

      var user = userFactory.create('01234'),
          deferred,
          successResponse = JSON.stringify({isAdded:true}),
          async = new AsyncSpec(this);

      beforeEach(function() {
        deferred = $.Deferred();
        spyOn($, "ajax").andCallFake(function() {
          return deferred;
        });
      });

      afterEach(function() {
        deferred = undefined;
        session.getUsers().length = 0;
      });

      async.it('should respond on success upon adding user', function(done) {
        addUserCommand.setUser(user).execute(function() {
          done();
        });
        deferred.resolve(successResponse);
      });

      async.it('should append user to user list on session', function(done) {
        addUserCommand.setUser(user).execute(function() {
          var users = session.getUsers(),
              userOnSession = users[users.length-1];
          expect(userOnSession).toBe(user);
          done();
        });
        deferred.resolve(successResponse);
      });

    });

    describe('add request of existing user', function() {

      var user = userFactory.create('12345'),
          deferred,
          falseResponse = JSON.stringify({isAdded:false}),
          async = new AsyncSpec(this);

      beforeEach(function() {
        deferred = $.Deferred();
        session.addUser(user);
        spyOn($, "ajax").andCallFake(function() {
          return deferred;
        });
      });

      afterEach(function() {
        deferred = undefined;
        session.getUsers().length = 0;
      });

      async.it('should respond on fault if existing user', function(done) {
        addUserCommand.setUser(user).execute(null, function() {
          done();
        });
        deferred.resolve(falseResponse);
      });

      async.it('should not append existing user to user list of session', function(done) {
        var userLength = session.getUsers().length;
        addUserCommand.setUser(user).execute(null, function() {
          expect(session.getUsers().length).toEqual(userLength);
          done();
        });
        deferred.resolve(falseResponse);
      });

    });

  });

});