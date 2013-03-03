package player
{
	import enemy.Wizard;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import state.OverState;
	import weapon.*;

	public class Player extends FlxSprite
	{
		
		public var experience:int = 0;
		private var speed:Number = 100;
		public var direction:uint;
		
		public function Player(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null)
		{
			super(X, Y, SimpleGraphic);
			
			loadGraphic(Embed.hero, true, false, 32, 48);
			addAnimation("down", [0, 1, 2], 10, false);
			addAnimation("left", [3, 4, 5], 10, false);
			addAnimation("right", [6, 7, 8], 10, false);
			addAnimation("up", [9, 10, 11], 10, false);
			
			health = 100;
			direction = FlxObject.DOWN;		
		}
		
		override public function update():void {
			Hud.create();	
			super.update();			
			movement();
			Weapon.player(PlasmaBall);
			animation();
			worldBounds();			
		}
		
		public function knockBack(force:Number):void {
			switch(direction) {
				case FlxObject.UP:
					velocity.y = force;
					break;
				case FlxObject.DOWN:
					velocity.y = -force;
					break;
				case FlxObject.LEFT:
					velocity.x = force;
					break;
				case FlxObject.RIGHT:
					velocity.x = -force;
					break;
			}		
		}
		
		override public function kill():void {
			super.kill();
			FlxG.switchState(new OverState);
		}
		
		private function movement():void {
			if(!FlxG.keys.UP && !FlxG.keys.DOWN) {
				if (FlxG.keys.LEFT) {
					velocity.x = -speed;
				}
				else if (FlxG.keys.RIGHT) {
					velocity.x = speed;
				}
				else {
					velocity.x = 0;
				}
			}
			if(!FlxG.keys.LEFT && !FlxG.keys.RIGHT) {
				if (FlxG.keys.UP) {
					velocity.y = -speed;
				}
				else if (FlxG.keys.DOWN) {
					velocity.y = speed;
				}
				else {
					velocity.y = 0;
				}
			}
			
			
			if(!FlxG.keys.UP && !FlxG.keys.DOWN)
				velocity.y = 0;
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT)
				velocity.x = 0;
				
		}
		
		private function worldBounds():void {
			if (x < 0)
				x = 0;
			if (y < 0)
				y = 0;			
				
			if ((x + width) > FlxG.worldBounds.width)				
				x = FlxG.worldBounds.width - width;
			if ((y + height) > FlxG.worldBounds.height)
				y = FlxG.worldBounds.height - height;				
		}
		
		
		private function animation():void {		
			if (velocity.x < 0) {					
				play("left");
				direction = FlxObject.LEFT;				
			}
			else if (velocity.x > 0) {
				play("right");
				direction = FlxObject.RIGHT;				
			}
			if (velocity.y < 0) {
				play("up"); 
				direction = FlxObject.UP;
			}
			else if (velocity.y > 0) {
				play("down");
				direction = FlxObject.DOWN;				
			}		
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
		
	}//class
}//package