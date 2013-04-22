package com.infrared5.application.model
{
	import com.infrared5.application.event.UserListChangeEvent;
	
	import flash.events.EventDispatcher;

	[Event(name="userAdd", type="com.infrared5.application.event.UserListChangeEvent")]
	[Event(name="userRemove", type="com.infrared5.application.event.UserListChangeEvent")]
	public class Session extends EventDispatcher {
		
		private var _users:Vector.<User>;
		
		public function Session() {
			_users = Vector.<User>([]);
		}
		
		public function findUserById(value:String):User {
			var i:int = _users.length;
			var user:User;
			while(--i > -1) {
				user = _users[i];
				if(user.id == value) {
					return user;
				}
			}
			return null;
		}
		
		public function addUser(value:User):User {
			if(findUserById(value.id) == null ) {
				_users[_users.length] = value;
				dispatchEvent(new UserListChangeEvent(UserListChangeEvent.USER_ADD, value, this));
			}
			return value;
		}
		
		public function get users():Vector.<User> {
			return _users;
		}
	}
}