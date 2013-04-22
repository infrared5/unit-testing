package support
{
	import com.infrared5.application.service.UserService;
	
	import mockolate.nice;
	import mockolate.prepare;
	
	import org.jasmineflex.global.runs;
	import org.jasmineflex.global.waitsFor;

	public class Prepare {
		
		public static var mockUserService:UserService;
		
		public static function UserServicePrep(responder:Function):void {
			prepare([UserService]);
			waitsFor(function():Boolean {
				try {
					mockUserService = nice(UserService, "userService", ["http://localhost"]);
					return true;
				}
				catch(e:Error) {
					return false;
				}
				return false;
			}, "Could not prepare user service.", 2000);
			
			runs(function():void {
				responder(mockUserService);
			});
		}
		
	}
}