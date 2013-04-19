package test.com.infrared5.application.command
{
	import com.infrared5.application.command.AddUserCommand;
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
	public class AddUser {
		
		public var user:User;
		public var session:Session;
		public var command:AddUserCommand;
		[Mock(inject="false")]
		public var userService:UserService;
		public var dispatcher:URLLoader = new URLLoader();
		public static const USER_ID:String = new Date().time.toString();
		
		[Before]
		public function setUp():void {
			user = new User(USER_ID);
			session = new Session();
			command = new AddUserCommand();
			userService = nice(UserService, "userService");
			
			command.userService = userService;
			command.session = session;
			command.setUser(user);
			
			stub(userService).method('addUser').returns(dispatcher);
		}
		
		[After]
		public function tearDown():void {
			user = null;
			session = null;
			command = null;
			userService = null;
		}
		
		private function handleAsyncTestTimeout(info:Object = null):void {
			Assert.fail("Could not properly test append on session list. Timeout.");
		}
		
		[Test(async, description="should return user on successful responder.")]
		public function test_user_returned_on_add_response():void {
			// response.
			var response:Object = {
				user: null
			};
			// Async hanlder to resolve test.
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertEquals("should return user added", passthrough.user, user);
			}, 2000, response, handleAsyncTestTimeout);
			// execution and success responder.
			command.execute(function(user:User):void {
				response.user = user;
				handler.call(null);
			}, null);
			// stubbed dispatch.
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		[Test(async, description="should append previously non-existant user to session listing.")]
		public function test_append_user_to_session_on_add():void {
			// response.
			var response:Object = {
				user: null
			};
			// Async hanlder to resolve test.
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertEquals("should update length by 1", 1, session.users.length);
			}, 2000, response, handleAsyncTestTimeout);
			// execution and success responder.
			command.execute(function(user:User):void {
				response.user = user;
				handler.call(null);
			}, null);
			// stubbed dispatch.
			dispatcher.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		[Test(async, description="should respond on fault delegate if user not added.")]
		public function test_fault_response_on_no_add():void {
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertTrue("should have gotten here if working as expected.", true);
			}, 2000, null, handleAsyncTestTimeout);
			// execution and success responder.
			command.execute(null, function():void {
				handler.call(null);
			});
			// stubbed dispatch.
			dispatcher.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
		}
		
		[Test(async, description="should not add user to session list on fault.")]
		public function test_session_user_list_unaffect_on_fault():void {
			var previousUserLength:int = session.users.length;
			var handler:Function = Async.asyncHandler(this, function(evt:Event, passthrough:Object = null):void {
				Assert.assertEquals("should not affect session list.", previousUserLength, session.users.length); 
			}, 2000, null, handleAsyncTestTimeout);
			// execution and success responder.
			command.execute(null, function():void {
				handler.call(null);
			});
			// stubbed dispatch.
			dispatcher.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
		}
	}
}