package org.denivip.osmf.logging
{
	import flash.external.ExternalInterface;

	public class LogGrabber extends LogHandler
	{
		private static const SEPARATOR:String = '###';
		
		private var _messages:Vector.<LogMessage>;
		
		public function LogGrabber()
		{
			super();
			
			_messages = new Vector.<LogMessage>;
		}
		
		override public function handleMessage(logMessage:LogMessage):void{
			_messages.push(logMessage);
		}
		
		public function sendLog():void{
			var result_log:String = '';
			for each(var lm:LogMessage in _messages){
				result_log += lm.toString();
				result_log += SEPARATOR;
			}
			
			ExternalInterface.call('sendLog', result_log);
		}
	}
}