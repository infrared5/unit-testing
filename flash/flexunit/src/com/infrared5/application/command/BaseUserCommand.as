package com.infrared5.application.command
{
	import com.infrared5.application.model.Session;
	import com.infrared5.application.model.User;
	import com.infrared5.application.service.UserService;
	
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	
	public class BaseUserCommand implements IUserCommand {
		
		public var session:Session;
		public var userService:UserService;
		
		protected var _user:User;
		protected var _successHandler:Function;
		protected var _faultHandler:Function;
		
		public function BaseUserCommand() {}
		
		protected function internalExecute():void {
			throw new IllegalOperationError('BaseUserCommand.internalExecute() needs to be overwritten in order to perform operation properly.');
		}
		
		protected function clear():void {
			_successHandler = null;
			_faultHandler = null;
			_user = null;
		}
		
		protected function addOperationHandlers(operation:IEventDispatcher):void {
			operation.addEventListener(Event.COMPLETE, handleSuccess, false, 0, true);
			operation.addEventListener(IOErrorEvent.IO_ERROR, handleFault, false, 0, true);
		}
		
		protected function removeOperationHandlers(operation:IEventDispatcher):void {
			operation.removeEventListener(Event.COMPLETE, handleSuccess, false);
			operation.removeEventListener(IOErrorEvent.IO_ERROR, handleFault, false);
		}
		
		protected function handleSuccess(evt:Event):void {
			_successHandler.call(null, _user);
			clear();
		}
		
		protected function handleFault(evt:IOErrorEvent):void {
			_faultHandler.call(null, evt.text);
			clear();
		}
		
		public function setUser(value:User):IUserCommand {
			_user = value
			return this;
		}
		
		public function execute(success:Function, failure:Function):void {
			_successHandler = success;
			_faultHandler = failure;
			internalExecute();
		}
	}
}