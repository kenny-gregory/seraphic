package {
	
	import org.flixel.FlxGame;
	import state.MenuState;
	
	[SWF(width = "320", height = "320", backgroundColor = "#000000")]	
	
	public class Game extends FlxGame {
		
		public function Game() {
			super(320, 320, MenuState, 1, 30, 30, false);
			forceDebugger = true;
		}
		
	}//class
}//package