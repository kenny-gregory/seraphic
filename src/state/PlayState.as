package state 
{
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxRect;
	import org.flixel.FlxText;
	import org.flixel.FlxState; 
	import player.Player;
	import weapon.Weapon;
	
	import enemy.*;
	import npc.*;
	import org.flixel.FlxTilemap;
	
	public class PlayState extends FlxState
	{
		
		public var level:Object;
		public var layer1:FlxGroup;
		public var layer2:FlxGroup;
		public var layer3:FlxGroup; // bullets
		public var layer4:FlxGroup; // player
		public var layer5:FlxGroup;
		public var layer6:FlxGroup;
		
		override public function create():void {
			super.create();	
			layers();			
			Groups.create();
		}
		
		private function layers():void {
			layer1 = new FlxGroup;
			layer2 = new FlxGroup;
			layer3 = new FlxGroup;
			layer4 = new FlxGroup;
			layer5 = new FlxGroup;
			layer6 = new FlxGroup;
			
			add(layer1);
			add(layer2);
			add(layer3);
			add(layer4);
			add(layer5);
			add(layer6);
		}
		
		override public function update():void {
			super.update();		
			World.update();
			Registry.stateSwitch();
			collision();
		}
		
		private function collision():void {
			FlxG.collide(Registry.player, Groups.enemy, Collision.enemyCollision);
			FlxG.collide(Registry.player, Groups.npc, Collision.npcCollision);
			FlxG.collide(Registry.player, Registry.level.hitTilemaps, null);			
		}
		
		override public function destroy():void {
			super.destroy();
			Registry.player = null;
			World.destroy();
			Weapon.destroy();
			Groups.destroy();
		}
		
	}//class
}//package