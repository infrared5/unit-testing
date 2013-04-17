package com.infrared5.application.command
{
	import flash.events.IEventDispatcher;

	public class RemoveUserCommand extends BaseUserCommand {
		
		private var operation:IEventDispatcher
		
		public function RemoveUserCommand() {
			super();
		}
		
		override protected function clear():void {
			super.clear();
			removeOperationHandlers(operation);
			operation = null;
		}
		
		override protected function internalExecute():void {
			operation = this.userService.removeUser(_user);
			addOperationHandlers(operation);
		}
	}
}