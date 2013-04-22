package com.infrared5.application.model
{
	public class User {
		
		public var name:String;
		private var _id:String;
		private static const RESERVED_PROPERTIES:Vector.<String> = Vector.<String>(['id']);
		
		public function User(id:String) {
			_id = id;
		}
		
		public function get id():String {
			return _id;
		}
		
		public static function inflate(value:Object):User {
			var user:User = new User(value.id);
			var property:String;
			for(property in value) {
				if( RESERVED_PROPERTIES.indexOf(property) == -1 && 
					user.hasOwnProperty(property)) {
					user[property] = value[property];
				}
			}
			return user;
		}
	}
}