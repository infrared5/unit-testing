import com.infrared5.application.command.AddUserCommand;
import com.infrared5.application.model.Session;
import com.infrared5.application.model.User;
import com.infrared5.application.service.UserService;

import flash.events.Event;
import flash.events.IOErrorEvent;
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
		command = null;
		session = null;
		userService = null;
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
		
		it("should append previously non-existant user to session listing.", function():void {
			var responseUser:User;
			command.execute(function(response:Object):void {
				responseUser = response as User;
			}, null);
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			
			waitsFor(function():* {
				return responseUser != null;
			}, "Could not properly test add user. Timeout.", 500);
			
			runs(function():void {
				expect(session.users.length).toEqual(1);
				expect(session.users[0]).toEqual(user);
			});
		});
		
	});
	
	describe("add previously existant user", function():void {
		
		it("should respond on fault if user not added", function():void {
			var responseMessage:String;
			command.execute(null, function(response:Object):void {
				responseMessage = response as String;
			});
			dispatcher.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
			
			waitsFor(function():* {
				return responseMessage != null;
			}, "Could not properly test add user. Timeout.", 500);
			
			runs(function():void {
				expect(responseMessage as String).not.toBeNull();
			});
		});
		
		it("should not affect session user list on fault", function():void {
			var responseMessage:String;
			var previousSessionUserLength:int = session.users.length;
			command.execute(null, function(response:Object):void {
				responseMessage = response as String;
			});
			dispatcher.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
			
			waitsFor(function():* {
				return responseMessage != null;
			}, "Could not properly test add user. Timeout.", 500);
			
			runs(function():void {
				expect(session.users.length).toEqual(previousSessionUserLength);
			});
		});
		
	});
});