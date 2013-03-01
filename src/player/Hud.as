package player 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import state.PlayState;
	
	public class Hud 
	{
		public static var created:Boolean = false;
		public static var expText:FlxText;
		public static var healthText:FlxText;
		
		public static function create():void {
			if (created)
				return;
				
			healthText = new FlxText(10, FlxG.height - 25, 100, "health: ", false);
			healthText.setFormat("Verdana", 10, 0xffffff, "left", 0xff000000);
			healthText.scrollFactor.x = healthText.scrollFactor.y = 0;
			(FlxG.state as PlayState).layer6.add(healthText);			
				
			expText = new FlxText(FlxG.width - 75, FlxG.height - 25, 75, null, false);
			expText.setFormat("Verdana", 10, 0xffffff, "left", 0xff000000);
			expText.scrollFactor.x = expText.scrollFactor.y = 0;
			(FlxG.state as PlayState).layer6.add(expText);
			
			
			created = true;
		}
		
		public static function update():void {
			if(created) {
				expText.text = "exp: " + Registry.player.experience;
				healthText.text = "health: " + Registry.player.health;
			}
		}
		
		public static function destroy():void {
			expText = null;
			healthText = null;
			created = false;
		}
		
	}//class
}//package