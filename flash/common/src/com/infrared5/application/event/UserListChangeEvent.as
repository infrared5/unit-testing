package com.infrared5.application.event
{
	import com.infrared5.application.model.Session;
	import com.infrared5.application.model.User;
	
	import flash.events.Event;
	
	public class UserListChangeEvent extends Event{
		
		public var user:User;
		public var session:Session;
		public static const USER_ADD:String = "userAdd";
		
		public function UserListChangeEvent(type:String, user:User, session:Session) {
			super(type);
			this.user = user;
			this.session = session;
		}
		
		override public function clone():Event {
			return new UserListChangeEvent(this.type, this.user, this.session);
		}
	}
}