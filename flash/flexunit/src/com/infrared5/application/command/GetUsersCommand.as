package com.infrared5.application.command
{
	import com.infrared5.application.model.Session;
	import com.infrared5.application.model.User;
	import com.infrared5.application.service.UserService;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;

	public class GetUsersCommand implements ICommand {
		
		public var session:Session;
		public var userService:UserService;
		
		private var successHandler:Function;
		private var faultHandler:Function;
		private var operation:URLLoader;
		
		public function GetUsersCommand() {}
		
		protected function clear():void {
			successHandler = null;
			faultHandler = null;
			operation = null;
		}
		
		private function addOperationHandlers(operation:IEventDispatcher):void {
			operation.addEventListener(Event.COMPLETE, handleSuccess, false, 0, true);
			operation.addEventListener(IOErrorEvent.IO_ERROR, handleFault, false, 0, true);
		}
		
		private function removeOperationHandlers(operation:IEventDispatcher):void {
			operation.removeEventListener(Event.COMPLETE, handleSuccess, false);
			operation.removeEventListener(IOErrorEvent.IO_ERROR, handleFault, false);
		}
		
		protected function handleSuccess(evt:Event):void {
			var users:Array = JSON.parse(operation.data) as Array;
			var i:int = 0;
			var length:int = users.length;
			var user:User;
			for(i; i < length; i++) {
				user = User.inflate(users[i]);
				session.addUser(user);	
			}	 
			successHandler.call(null, users);
			clear();
		}
		
		protected function handleFault(evt:IOErrorEvent):void {
			faultHandler.call(null, evt.text);
			clear();
		}
		
		public function execute(success:Function, failure:Function):void {
			successHandler = success;
			faultHandler = failure;
			
			operation = userService.getUsers();
			addOperationHandlers(operation);
		}
	}
}