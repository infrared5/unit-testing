package com.infrared5.application.command
{
	import com.infrared5.application.model.User;

	public interface IUserCommand extends ICommand {
		function setUser(value:User):IUserCommand;
	}
}