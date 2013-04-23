import com.infrared5.application.command.GetUsersCommand;
import com.infrared5.application.model.Session;
import com.infrared5.application.model.User;
import com.infrared5.application.service.UserService;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;

import mockolate.stub;

import org.jasmineflex.global.*;

import support.Prepare;

describe("Get Users", function():void {
	var session:Session;
	var command:GetUsersCommand;
	var userService:UserService;
	var dispatcher:URLLoader;
	
	var userOne:User;
	var userOneId:String = "1234";
	var userOneName:String = "ted henderson";
	var userTwo:User;
	var userTwoId:String = "9876";
	var userTwoName:String = "tad arransson";
	var usersJSONResponse:String;
	
	beforeEach(function():void {
		session = new Session();
		command = new GetUsersCommand();
		userOne = new User(userOneId);
		userOne.name = userOneName;
		userTwo = new User(userTwoId);
		userTwo.name = userTwoName;
		usersJSONResponse = JSON.stringify([userOne, userTwo]);
		
		Prepare.LoaderPrep(function(mockLoader:URLLoader):void {
			dispatcher = mockLoader;
			stub(dispatcher).asEventDispatcher();
		});
		Prepare.UserServicePrep(function(mockService:UserService):void {
			userService = mockService;
			
			command.session = session;
			command.userService = userService;
			stub(userService).method("getUsers").returns(dispatcher);
		});
	});
	
	afterEach(function():void {
		session = null;
		command = null;
		userService = null;
		dispatcher = null;
	});
	
	describe("success in accessing user list", function():void {
		
		it("should update list help on session", function():void {
			var responseCalled:Boolean;
			command.execute(function(payload:Object):void {
				responseCalled = true;
			}, null);
			dispatcher.data = usersJSONResponse;
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			
			waitsFor(function():* {
				return responseCalled;
			}, "Could not complete test. Timeout.", 2000);
			
			runs(function():void {
				expect(session.users.length).toEqual(2);
			});
		});
		
		it("should respond with user list on response", function():void {
			var users:Array;
			var responseCalled:Boolean;
			command.execute(function(payload:Object):void {
				users = payload as Array;
				responseCalled = true;
			}, null);
			dispatcher.data = usersJSONResponse;
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			
			waitsFor(function():* {
				return responseCalled;
			}, "Could not complete test. Timeout.", 2000);
			
			runs(function():void {
				expect(users).not.toBeNull();
				expect(users.length).toEqual(2);
			});
		});
		
	});
	
	describe("user access on session", function():void {
		
		it("should locate user based on id", function():void {
			var responseCalled:Boolean;
			command.execute(function(payload:Object):void {
				responseCalled = true;
			}, null);
			dispatcher.data = usersJSONResponse;
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			
			waitsFor(function():* {
				return responseCalled;
			}, "Could not complete test. Timeout.", 2000);
			
			runs(function():void {
				expect(session.findUserById(userOneId)).not.toBeNull();
				expect(session.findUserById(userOneId).name).toEqual(userOneName);
			});
		});
		
	});
	
	describe("fault in accessing user list", function():void {
		
		it("should not affect session user list on fault", function():void {
			var responseCalled:Boolean;
			var previousUsersLength:int = session.users.length;
			command.execute(null, function(errorMessage:String):void {
				responseCalled = true;
			});
			dispatcher.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
			
			waitsFor(function():* {
				return responseCalled;
			}, "Could not complete test. Timeout.", 2000);
			
			runs(function():void {
				expect(session.users.length).toEqual(previousUsersLength);
			});
		});
		
	});
});