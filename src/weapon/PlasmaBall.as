package weapon 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import state.*;

	public class PlasmaBall extends Bullet
	{
		
		public var speed:Number = 500;
		
		public function PlasmaBall(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(Embed.plasmaballlpc_0, true, false, 32, 32, false);
			addAnimation("shoot", [0, 1, 2], 10, true);
			addAnimation("collide", [3], 0, false);
			play("shoot");
			shoot();
		}
		
		public function shoot():void {
			
			exists = true;
			velocity.x = 0;
			velocity.y = 0;
			
			x = Registry.player.x + (Registry.player.width / 2);
			y = Registry.player.y + (Registry.player.height / 2);
			
			switch(Registry.player.direction) {
				case FlxObject.UP:
					velocity.y = -speed;
					break;
				case FlxObject.DOWN:
					velocity.y = speed;
					break;
				case FlxObject.LEFT:
					velocity.x = -speed;
					break;
				case FlxObject.RIGHT:
					velocity.x = speed;
					break;
			}
			
			(FlxG.state as PlayState).layer4.add(this);	
		}
		
		override public function update():void {
			super.update();
			
			if (x > (FlxG.width + FlxG.camera.scroll.x) ||  x < 0 ||
				y > (FlxG.height + FlxG.camera.scroll.y) || y < 0) {
					exists = false;	
				}
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package