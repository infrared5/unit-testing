package com.infrared5.application.command
{
	public interface ICommand {
		function execute(success:Function, failure:Function):void;
	}
}