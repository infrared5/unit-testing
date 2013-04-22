package com.infrared5.application.service
{
	import com.infrared5.application.model.User;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	public class UserService {
		
		private var _endpoint:String;
		
		public function UserService(endpoint:String) {
			_endpoint = endpoint;
		}
		
		public function getUsers():URLLoader {
			var request:URLRequest = new URLRequest(_endpoint + '\users');
			request.method = URLRequestMethod.GET;
			return new URLLoader(request);
		}
		
		public function addUser(value:User):URLLoader {
			var request:URLRequest = new URLRequest(_endpoint + '\users\\' + value.id);
			request.method = URLRequestMethod.POST;
			request.data = JSON.stringify(value);
			return new URLLoader(request);
		}
	}
}