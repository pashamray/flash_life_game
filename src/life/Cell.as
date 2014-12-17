package life 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author pashamray
	 */
	public class Cell extends Sprite 
	{
		private var _width:Number;
		private var _height:Number;
		private var _color:Number;
		
		private var _life:Boolean;
				
		public function Cell(width:Number, height:Number, color:uint) 
		{
			super();
			
			_width = width;
			_height = height;
			_color = color;
			
			life = false;
			
			clear();
			
			this.mouseEnabled = true;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, onMouseEvent);
		}
		
		private function onMouseEvent(event:MouseEvent):void 
		{
			switch(event.type) {
				case MouseEvent.CLICK:
					life = !life;
					break;
			}
		}

		public function set life(value:Boolean):void {
			
			if (_life != value) {
				_life = value;
				if (_life) {
					draw();
				} else {
					clear();
				}
			}
		}
		
		public function get life():Boolean {
			return _life;
		}
		
		private function clear():void {
			graphics.clear();
			graphics.beginFill(0x1D1D1D);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
		
		private function draw():void {
			graphics.clear();
			graphics.beginFill(Math.round(Math.random() * 16581375));
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
		
		override public function get width():Number {
			return _width;
		}
		
		override public function get height():Number {
			return _height;
		}
	}

}