package life {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author pashamray
	 */
	public class Life extends Area implements IArea, ILife
	{
		private static const DELAY_GENERATION:uint = 250;
		
		private var _timer:Timer;
		
		public function Life(cols:Number, rows:Number) 
		{
			super(cols, rows);
			_timer = new Timer(DELAY_GENERATION, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerGeneration);
			
			start();
		}
		
		private function onTimerGeneration(event:TimerEvent):void 
		{
			step();
			
			_timer.reset();
			_timer.start();
		}
		
		public function start():void {
			draw();
			_timer.start();
		}
		
		public function stop():void {
			pause();
			clear();
		}
		
		public function step():void {
			draw_next();
		}
		
		public function pause():void {
			if(_timer) {
				_timer.stop();
			}
		}
	}

}