package test.com.infrared5.application.command
{
	import com.infrared5.application.model.Session;
	import com.infrared5.application.model.User;
	import com.infrared5.application.service.UserService;
	
	import flexunit.framework.Assert;
	
	import mockolate.nice;
	import mockolate.runner.MockolateRunner;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class AddUser {
		
		public var user:User;
		public var session:Session;
		[Mock(inject="false")]
		public var userService:UserService;
		public static const USER_ID:String = new Date().time.toString();
		
		[Before]
		public function setUp():void {
			user = new User(USER_ID);
			session = new Session();
			userService = nice(UserService, "userService");
		}
		
		[After]
		public function tearDown():void {
			user = null;
			session = null;
		}
		
		[Test]
		public function testExecute():void {
			Assert.fail("Test method Not yet implemented");
		}
	}
}