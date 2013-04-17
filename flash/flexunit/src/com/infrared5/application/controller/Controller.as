package com.infrared5.application.service
{
	import com.infrared5.application.command.ICommand;
	import com.infrared5.application.command.IUserCommand;
	import com.infrared5.application.model.User;
	
	public class Controller {
		
		public var getUsersCommand:ICommand;
		public var addUserCommand:IUserCommand;
		public var removeUserCommand:IUserCommand;
		public var updateUserCommand:IUserCommand;
		
		public function Controller() {}
		
		public function getUsers():ICommand {
			return getUsersCommand.execute();
		}
		
		public function addUser(value:User):ICommand {
			return addUserCommand.setUser(value);
		}
		
		public function removeUser(value:User):ICommand {
			return removeUserCommand.setUser(value).execute();
		}
		
		public function updateUser(value:User):ICommand {
			return updateUserCommand.setUser(value).execute();
		}
	}
}