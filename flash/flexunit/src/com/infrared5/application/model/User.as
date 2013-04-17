package com.infrared5.application.model
{
	public class User {
		
		public var name:String;
		private var _id:String;
		
		public function User(id:String) {
			_id = id;
		}
		
		public function get id():String {
			return _id;
		}
	}
}