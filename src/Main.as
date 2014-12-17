package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import life.ILife;
	import life.Life;
	
	/**
	 * ...
	 * @author pashamray
	 */
	public class Main extends Sprite 
	{
		private var life:ILife;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			life = new Life(40, 40);
			//life.start();
			
			addChild(life as DisplayObject);
		}
		
	}
	
}