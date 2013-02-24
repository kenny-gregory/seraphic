package player
{
	import enemy.Wizard;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import weapon.*;

	public class Player extends FlxSprite
	{
		
		private var speed:Number = 100;
		public var direction:uint;
		
		public function Player(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null)
		{
			super(X, Y, SimpleGraphic);
			
			loadGraphic(Embed.hero, true, false, 32, 32);
			addAnimation("up", [0, 1, 2, 3, 4, 5, 6, 7, 8], 10, false);
			addAnimation("down", [18, 19, 20, 21, 22, 23, 24, 25, 26], 10, false);
			addAnimation("left", [9, 10, 11, 12, 13, 14, 15, 16, 17], 10, false);
			addAnimation("right", [27, 28, 29, 30, 31, 32, 33, 34, 35], 10, false);
			addAnimation("stand", [18], 0, false);
			play("stand");
			
			
			health = 100;
			direction = FlxObject.DOWN;
		}
		
		override public function update():void {
			super.update();			
			movement();
			Weapon.player(PlasmaBall);
			animation();
			worldBounds();			
		}
		
		public function knockBack(force:int):void {
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