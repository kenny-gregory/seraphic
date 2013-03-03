package enemy 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class Wizard extends Enemy
	{
		public var speed:Number = 15;
		
		public function Wizard(X:Number = 0, Y:Number = 0, SimpleClass:Class = null) 
		{
			super(X, Y, SimpleClass);
			// TODO: change graphical asset to match class name
			loadGraphic(Embed.tealKnight, true, false, 32, 48, false);
			addAnimation("down", [0, 1, 2], 10.000, true);
			addAnimation("left", [3, 4, 5], 10.000, true);
			addAnimation("right", [6, 7, 8], 10.000, true);
			addAnimation("up", [9, 10, 11], 10.000, true);
			health = 3;
			immovable = true;			
			experience = 10;
			Groups.wizards.add(this);
			
			movePadX = FlxG.width;
			movePadY = FlxG.height;
		}
		
		override public function update():void {
			super.update();
			move(speed);
			animate();
			worldBounds();
		}
		
		override public function kill():void {
			Groups.enemy.remove(this);
			Groups.wizards.remove(this);			
			super.kill();
		}		
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package