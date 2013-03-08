package state 
{
	
	import flash.display.Bitmap;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSound;
	import org.flixel.FlxText;
	import org.flixel.FlxState; 
	import player.Hud;
	import player.Player;
	import weapon.Weapon;
	
	import enemy.*;
	import npc.*;
	import org.flixel.FlxTilemap;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		
		public var render:Boolean = true;
		public var paused:Boolean = false;
		public var pausedGroup:FlxGroup;
		
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
			music();
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
		
		private function music():void {
			FlxG.music = new FlxSound;
			FlxG.music.loadEmbedded(Embed.music_interlude, true, false);
			FlxG.music.volume = .5;
			FlxG.music.play();			
		}
		
		public function pause(doRender:Boolean, updateItems:Array):void {	
			render = doRender;
			
			if (!pausedGroup)
				pausedGroup = new FlxGroup;
			
			for each(var item:FlxObject in updateItems) 
				pausedGroup.add(item);
				
			paused = !paused;
			updateItems = null;
		}
		
		public function unpause():void {
			pausedGroup.members.splice(0);
			paused = !paused;
		}
		
		override public function update():void {
			if (FlxG.keys.justPressed("ESCAPE")) 
				Inventory.enabled = !Inventory.enabled;
				
			Inventory.update();				
				
			if (paused)
				return pausedGroup.update();
				
			super.update();		
			World.update();
			collision();
			Hud.update();		
		}
		
		override public function draw():void {
			if (paused && !render)
				return pausedGroup.draw();
				
			super.draw();
		}
		
		private function collision():void {
			
			// bats
			for each(var b:Enemy in Groups.bats.members) {
				if(b) {
					if (FlxCollision.pixelPerfectCheck(Registry.player, b, 255, FlxG.camera)) {
						Collision.enemyCollision(Registry.player, b);					
					}
				}
			}
			// wizards
			for each(var w:Enemy in Groups.wizards.members) {
				if(w) {
					if (FlxCollision.pixelPerfectCheck(Registry.player, w, 255, FlxG.camera)) {		
						Collision.enemyCollision(Registry.player, w);					
					}
				}
			}			
			
			// pixel perfect map sprites
			for each(var pp:PixelSprite in Groups.pixelPerfect.members) {
				if (FlxCollision.pixelPerfectCheck(Registry.player, pp, 255, FlxG.camera)) {		
					Collision.pixelPerfect(Registry.player, pp);					
				}				
			}
			
			//FlxG.collide(Registry.player, Groups.enemy, Collision.enemyCollision);
			FlxG.collide(Registry.player, Groups.npc, Collision.npcCollision);
			FlxG.collide(Registry.player, Registry.level.hitTilemaps, null);			
			
		}
		
		override public function destroy():void {
			super.destroy();
			Registry.player = null;
			World.destroy();
			Weapon.destroy();
			Groups.destroy();
			Dialog.destroy();
			Hud.destroy();
			Inventory.destroy();
		}
		
	}//class
}//package