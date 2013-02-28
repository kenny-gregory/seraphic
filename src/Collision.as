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
//			p.knockBack(1000);
		}		
		
		public static function npcCollision(p:Player, n:*):void {
			n.showDialog();
		}
		
	}//class
}//package