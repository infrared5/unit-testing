package test.com.infrared5.application.command
{
	import com.infrared5.application.command.GetUsersCommand;
	import com.infrared5.application.model.Session;
	import com.infrared5.application.model.User;
	import com.infrared5.application.service.UserService;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	
	import flexunit.framework.Assert;
	
	import mockolate.nice;
	import mockolate.runner.MockolateRunner;
	import mockolate.stub;
	
	import org.flexunit.async.Async;

	MockolateRunner;
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class GetUsers {
		
		public var session:Session;
		public var command:GetUsersCommand;
		[Mock(inject="false")]
		public var loader:URLLoader;
		[Mock(inject="false")]
		public var userService:UserService;
		public var usersJSONResponse:String;
		
		public var userOne:User;
		public var userOneId:String = "1234";
		public var userOneName:String = "ted henderson";
		public var userTwo:User;
		public var userTwoId:String = "9876";
		public var userTwoName:String = "tad arransson";
		
		[Before]
		public function setUp():void {
			session = new Session();
			loader = nice(URLLoader, "loader");
			userService = nice(UserService, "userService");
			command = new GetUsersCommand();
			command.session = session;
			command.userService = userService;
			
			userOne = new User(userOneId);
			userOne.name = userOneName;
			userTwo = new User(userTwoId);
			userTwo.name = userTwoName;
			usersJSONResponse = JSON.stringify([userOne, userTwo]);
			
			stub(userService).method("getUsers").returns(loader);
			stub(loader).asEventDispatcher();
		}
		
		[After]
		public function tearDown():void {
			session = null;
			command = null;
			loader = null;
			userService = null;
			usersJSONResponse = null;
		}
		
		private function handleAsyncTestTimeout(info:Object = null):void {
			Assert.fail("Could not properly test append on session list. Timeout.");
		}
		
		[Test(async, description="should update user list on session upon success.")]
		public function test_session_list_updated_on_success():void {
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertEquals("should update list length", 2, session.users.length);
			}, 2000, null, handleAsyncTestTimeout);
			
			loader.data = usersJSONResponse;
			command.execute(function(result:Array):void {
				handler.call(null);
			}, null);
			loader.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		[Test(async, description="should respond with user list on success.")]
		public function test_user_list_provided_to_success_delegate():void {
			var response:Object = {
				result: null
			};
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertNotNull("should provide user list in success result", passthrough.result as Array);
				Assert.assertEquals("should provide user same as that on session", passthrough.result.length, session.users.length);
			}, 2000, response, handleAsyncTestTimeout);
			
			loader.data = usersJSONResponse;
			command.execute(function(result:Array):void {
				response.result = result;
				handler.call(null);
			}, null);
			loader.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		[Test(async, description="should not affect user list on session when fault occured.")]
		public function test_session_list_unaffected_on_fault():void {
			var errorMessage:String = "Boilerplate error message";
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertTrue("should have gotten here if working as expected.", true);
			}, 2000, null, handleAsyncTestTimeout);
			
			command.execute(null, function(message:String):void {
				handler.call(null);
			});
			loader.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR, false, false, errorMessage));
		}
		
		[Test(async, description="should expose access to users on session.")]
		public function test_user_available_on_session():void {
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				var user:User = session.findUserById(userOneId);
				Assert.assertNotNull("should return user by id", user);
				Assert.assertEquals("should return user by id and match name", user.name, userOneName);
			}, 2000, null, handleAsyncTestTimeout);
			
			loader.data = usersJSONResponse;
			command.execute(function(result:Array):void {
				handler.call(null);
			}, null);
			loader.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}