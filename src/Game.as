package {
	
	import org.flixel.FlxGame;
	import state.MenuState;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]	
	
	public class Game extends FlxGame {
		
		public function Game() {
			super(320, 240, MenuState, 2, 30, 30, false);
			forceDebugger = true;
		}
		
	}//class
}//package