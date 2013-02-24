package  
{
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import org.flixel.FlxRect;
	import state.*;
	import player.Player;
	
	public class World 
	{
		private static var c:FlxCamera;
		private static var p:Player;
		private static var map:Array = new Array("Level1", "Level2", "Level3", "Level4", "Level5", "Level6", "Level7", "Level8");
		private static var room:int;
		
		public static function update():void {
			if (!p) 
				createWorld();
			else 
				updateWorld();
		}		
		
		private static function createWorld():void {
			room = 0;
			level();
			c = FlxG.camera;
			p = Registry.player;
			camera();
		}
		
		private static function camera():void {
			FlxG.worldBounds = new FlxRect(0, 0, 2400, 1800);
			FlxG.camera.setBounds(0, 0, 2400, 1800);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_TOPDOWN_TIGHT);			
		}				
		
		private static function updateWorld():void {
			if (FlxG.keys.any()) { 
				if (FlxG.keys.LEFT || FlxG.keys.RIGHT || FlxG.keys.UP || FlxG.keys.DOWN) {
//					trace("p x,y: " + p.x + "," + p.y);
				}
			}			
		}
		
		public static function level():void {
			var roomClass:Class = getDefinitionByName(map[room]) as Class;
			Registry.level = new roomClass;
			(FlxG.state as PlayState).layer4.remove(p, true);
			(FlxG.state as PlayState).layer4.add(p);
			roomClass = null;
		}
		
		public static function destroy():void {
			c = null;
			p = null;
			room = 0;
		}
		
	}//class
}//package