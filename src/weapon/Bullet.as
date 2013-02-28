package weapon 
{
	
	import org.flixel.FlxSprite;

	public class Bullet extends FlxSprite 
	{
		
		public function Bullet(X:Number = 0, Y:Number = 0, SimpleClass:Class = null) 
		{
			super(X, Y, SimpleClass);
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package