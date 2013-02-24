package enemy 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class Wizard extends Enemy
	{
		
		public var direction:uint;
		
		public function Wizard(X:Number = 0, Y:Number = 0, SimpleClass:Class = null) 
		{
			super(X, Y, SimpleClass);
			loadGraphic(Embed.blueWizard, true, false, 32, 32, false);
			addAnimation("down", [0, 1, 2], 10.000, true);
			addAnimation("left", [3, 4, 5], 10.000, true);
			addAnimation("right", [6, 7], 10.000, true);
			addAnimation("up", [9, 10, 11], 10.000, true);
			
			direction = Math.floor(Math.random() * 3 + 1);
			switch(direction) {
				case 1:
					direction = FlxObject.UP;
					play("up");
					break;
				case 2:
					direction = FlxObject.DOWN;					
					play("down");
					break;
				case 3:
					direction = FlxObject.LEFT;					
					play("left");
					break;
				case 4:
					direction = FlxObject.RIGHT;					
					play("right");
					break;
			}
			
			health = 3;
			
			immovable = true;			
			
			Groups.wizards.add(this);
			
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package