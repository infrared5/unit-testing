define(['script/session', 'script/get-users-command', 'script/user-factory'], 
        function(session, getUsersCommand, userFactory) {
  
  describe('get-users', function() {

    describe('user list request', function() {

      var users,
        deferred,
        async = new AsyncSpec(this);

      beforeEach(function() {
        users = [userFactory.create('1234'), userFactory.create('5678')];
        spyOn($, "ajax").andCallFake(function() {
          deferred = $.Deferred();
          return deferred;
        });
      });

      afterEach(function() {
        session.getUsers().length = 0;
        deferred = undefined;
      });

      async.it('should expose user list on session on success', function(done) {
        getUsersCommand.execute(function(userList) {
          expect(session.getUsers()).toEqual(users);
          done();
        });
        deferred.resolve(JSON.stringify(users));
      });

      async.it('should not affect list on session if fault', function(done) {
        var preRequestUserList = session.getUsers().slice();
        getUsersCommand.execute(null, function(message) {
          expect(session.getUsers()).toEqual(preRequestUserList);
          done();
        });
        deferred.reject('Hung up.');
      });
      
    });

    describe('user access on session', function() {

      var uid = '01234',
          user = userFactory.create(uid);

      beforeEach(function() {
        session.addUser(user);
      });

      afterEach(function() {
        session.getUsers().length = 0;
      });

      it('should return user based on id', function() {
        expect(session.findUserById(uid)).toBe(user);
      });

      it('should not addUser() if exists', function() {
        var userLength = session.getUsers().length;
        session.addUser(user);
        expect(session.getUsers().length).toEqual(userLength);
      });

    });

  });

});