package life 
{
	
	/**
	 * ...
	 * @author pashamray
	 */
	public interface IArea 
	{
		function set_life(x:Number, y:Number):void;
		function set_die(x:Number, y:Number):void;
		function draw():void;
		function draw_next():void;
	}
	
}