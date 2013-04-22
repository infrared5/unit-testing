import com.infrared5.application.command.AddUserCommand;
import com.infrared5.application.model.Session;
import com.infrared5.application.model.User;
import com.infrared5.application.service.UserService;

import flash.events.Event;
import flash.net.URLLoader;

import mockolate.stub;

import org.jasmineflex.global.*;

import support.Prepare;

describe("Add User", function():void {
	
	var user:User;
	var session:Session;
	var command:AddUserCommand;
	var userService:UserService;
	var dispatcher:URLLoader = new URLLoader();
	const USER_ID:String = new Date().time.toString();
	
	beforeEach(function():void {
		user = new User(USER_ID);
		session = new Session();
		command = new AddUserCommand();
		Prepare.UserServicePrep(function(mockService:UserService):void {
			userService = mockService;
			
			command.session = session;
			command.userService = userService;
			command.setUser(user);
			
			stub(userService).method('addUser').returns(dispatcher);
		});
	});
	afterEach(function():void {
		user = null;
		session = null;
	});
	
	describe("add previously non-existant user", function():void {
		
		it("should return user on success", function():void {
			var responseUser:User;
			command.execute(function(response:Object):void {
				responseUser = response as User;
			}, null);
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			
			waitsFor(function():* {
				return responseUser != null;
			}, "Could not properly test add user. Timeout.", 500);
			
			runs(function():void {
				expect(responseUser).toEqual(user);
			});
		});
		
	});
});