package support
{
	import com.infrared5.application.service.UserService;
	
	import flash.net.URLLoader;
	
	import mockolate.nice;
	import mockolate.prepare;
	
	import org.jasmineflex.global.runs;
	import org.jasmineflex.global.waitsFor;

	public class Prepare {
		
		public static var mockURLLoader:URLLoader;
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
		
		public static function LoaderPrep(responder:Function):void {
			prepare([URLLoader]);
			waitsFor(function():Boolean {
				try {
					mockURLLoader = nice(URLLoader, "urlLoader", [null]);
					return true;
				}
				catch(e:Error) {
					return false;
				}
				return false;
			}, "Could not prepare URLLoader.", 2000);
			
			runs(function():void {
				responder(mockURLLoader);
			});
		}
		
	}
}