package com.infrared5.application.command
{
	import flash.events.IEventDispatcher;

	public class AddUserCommand extends BaseUserCommand {
		
		private var operation:IEventDispatcher;
		
		public function AddUserCommand() {
			super();
		}
		
		override protected function clear():void {
			super.clear();
			removeOperationHandlers(operation);
			operation = null;
		}
		
		override protected function internalExecute():void {
			operation = this.userService.addUser(_user);
			addOperationHandlers(operation);
		}
	}
}