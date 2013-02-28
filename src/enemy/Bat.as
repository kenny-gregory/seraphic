package enemy 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class Bat extends Enemy
	{
		public var speed:Number = 10;
		
		public function Bat(X:Number = 0, Y:Number = 0, SimpleClass:Class = null) 
		{
			super(X, Y, SimpleClass);
			loadGraphic(Embed.bat1, true, false, 32, 32, false);
			addAnimation("down", [0, 1, 2], 10.000, true);
			addAnimation("left", [3, 4, 5], 10.000, true);
			addAnimation("right", [6, 7], 10.000, true);
			addAnimation("up", [9, 10, 11], 10.000, true);
			health = 1;
			immovable = true;			
			Groups.bats.add(this);
			
			movePadX = 100;
			movePadY = 100;
		}
		
		override public function update():void {
			super.update();
			move(speed);
			animate();
			worldBounds();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package