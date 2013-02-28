package player 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	import state.PlayState;
	
	public class Hud 
	{
		
		public static var expText:FlxText;
		
		public static function create():void {
			expText = new FlxText(FlxG.width - 100, 10, 100, null, false);
			expText.setFormat("Verdana", 10, 0xffffff, "left", 0xff000000);
			expText.scrollFactor.x = expText.scrollFactor.y = 0;
			(FlxG.state as PlayState).layer6.add(expText);
		}
		
		public static function update():void {
			expText.text = "exp: " + Registry.player.experience;
		}
		
		public static function destroy():void {
			
		}
		
	}//class
}//package