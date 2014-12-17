package life 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author pashamray
	 */
	public class Area extends Sprite implements IArea
	{
		private static const CELL_COLOR:uint = 0x00FF00;
		private static const CELL_WIDTH:Number = 20;
		private static const CELL_HEIGHT:Number = 20;
		
		private var vCurCells:Vector.<Vector.<Cell>>;
		private var vNexCells:Vector.<Vector.<Cell>>;
		
		private var _cols:Number;
		private var _rows:Number;
		
		public function Area(cols:Number, rows:Number) 
		{
			super();
			
			_cols = cols;
			_rows = rows;
			
			vCurCells = new Vector.<Vector.<Cell>>(rows);
			vNexCells = new Vector.<Vector.<Cell>>(rows);
			
			for (var i:int = 0; i < rows; i++) 
			{
				vCurCells[i] = new Vector.<Cell>(cols);
				vNexCells[i] = new Vector.<Cell>(cols);
				for (var j:int = 0; j < cols; j++) 
				{
					vCurCells[i][j] = new Cell(CELL_WIDTH, CELL_HEIGHT, CELL_COLOR);
					vNexCells[i][j] = new Cell(CELL_WIDTH, CELL_HEIGHT, CELL_COLOR);
				}
			}
			
			cells_init();
		}
		
		private function cells_init():void {			
			set_random_cells();
		}
		
		private function set_random_cells():void {
			
			for (var i:int = 0; i < vCurCells.length; i++) 
			{
				for (var j:int = 0; j < vCurCells[i].length; j++) 
				{	
					vCurCells[i][j].life = ((Math.round(Math.random() * 10) == 2)) ? true : false;
				}
			}			
		}
		
		public function draw():void {
			
			for (var i:int = 0; i < vCurCells.length; i++) 
			{
				for (var j:int = 0; j < vCurCells[i].length; j++) 
				{
					addChild(vCurCells[i][j]);
					vCurCells[i][j].x = i * CELL_WIDTH;
					vCurCells[i][j].y = j * CELL_HEIGHT;
				}
			}
		}
		
		private function modr(a:int):int {
			return (a + _rows) % _rows;
		}
		
		private function modc(a:int):int {
			return (a + _cols) % _cols;
		}
		
		private function calc_next():void {
			
			var neighbors:uint;
			
			// calc next state			
			for (var r:int = 0; r < vCurCells.length; r++) 
			{
				for (var c:int = 0; c < vCurCells[r].length; c++) 
				{	
					neighbors = 0;
					// count alive neighbors
					neighbors += (vCurCells[modr(r + 1)][modc(c)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r) ][modc(c + 1)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r - 1)][modc(c) ].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r) ][modc(c - 1)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r + 1)][modc(c + 1)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r - 1)][modc(c - 1)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r + 1)][modc(c - 1)].life == true) ? 1 : 0;
					neighbors += (vCurCells[modr(r - 1)][modc(c + 1)].life == true) ? 1 : 0;
					
					if (vCurCells[r][c].life == true) {
						if (neighbors < 2 || neighbors > 3) {
							vNexCells[r][c].life = false;
						} else {
							vNexCells[r][c].life = true;
						}
					} else {
						if (neighbors == 3) {
							vNexCells[r][c].life = true;
						}
					}
				}
			}
		}
		
		public function draw_next():void {
			calc_next();
			//clear();

			for (var i:int = 0; i < vNexCells.length; i++) 
			{
				for (var j:int = 0; j < vNexCells[i].length; j++) {
					
					vCurCells[i][j].life = vNexCells[i][j].life;
				}
			}
			
			//draw();
		}
		
		public function clear():void {
			while (this.numChildren) {
				this.removeChildAt(0);
			}
		}
		
		public function set_life(col:Number, row:Number):void {
			vCurCells[col][row].life = true;
		}
		
		public function set_die(col:Number, row:Number):void {
			vCurCells[col][row].life = false;
		}
		
	}

}