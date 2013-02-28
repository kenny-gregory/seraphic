package  
{

	import player.Player;
	import enemy.*;
	import npc.*;
	
	public class Collision 
	{
		
		public static function enemyCollision(p:Player, e:Enemy):void {
			p.flicker(.25);
			p.hurt(1);
//			p.knockBack(500);
		}		
		
		public static function npcCollision(p:Player, n:NPC):void {
			trace("npc: " + n);
			n.showDialog();
		}
		
	}//class
}//package