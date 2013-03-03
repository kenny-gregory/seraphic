package {
	
	import org.flixel.FlxGame;
	import state.MenuState;
	
	[SWF(width = "400", height = "300", backgroundColor = "#000000")]	
	
	public class Game extends FlxGame {
		
		public function Game() {
			super(400, 300, MenuState, 1, 30, 30, false);
			forceDebugger = true;
		}
		
	}//class
}//package