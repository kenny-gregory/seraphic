package  
{

	import org.flixel.FlxG;
	import player.Player;
	import enemy.*;
	import npc.*;
	
	public class Collision 
	{
		
		public static function enemyCollision(p:Player, e:Enemy):void {
			p.flicker(.25);
			p.hurt(1);
//			p.knockBack(1000);
		}		
		
		public static function pixelPerfect(p:Player, pp:PixelSprite):void {
			trace("p/pp: " + p + "/" + pp);
			// check to see if the height/width allows for overlap or seperate and apply those
		}
		
		public static function npcCollision(p:Player, n:*):void {
			n.showDialog();
		}
		
	}//class
}//package