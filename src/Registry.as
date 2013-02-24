package  
{

	import state.*;
	import org.flixel.FlxG;
	import player.Player;
	
	public class Registry 
	{
		
		public static var level:BaseLevel;
		public static var player:Player;
		public static var realStageW:Number;
		public static var realStageH:Number;
		
		public static function stateSwitch():void {
			if (FlxG.keys.N) {
				if (FlxG.state is MenuState) {
					FlxG.switchState(new PlayState);
				}
				else if (FlxG.state is PlayState) {
					FlxG.switchState(new OverState);
				}
				else if (FlxG.state is OverState) {
					FlxG.switchState(new MenuState);
				}
			}			
		}
		
	}//class
}//package