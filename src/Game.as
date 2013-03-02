package {
	
	import org.flixel.FlxGame;
	import state.MenuState;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]	
	
	public class Game extends FlxGame {
		
		public function Game() {
			super(400, 300, MenuState, 2, 30, 30, false);
			forceDebugger = true;
		}
		
	}//class
}//package