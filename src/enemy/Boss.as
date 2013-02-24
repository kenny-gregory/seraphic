package enemy 
{
	
	import org.flixel.FlxSprite;

	public class Boss extends FlxSprite
	{
		
		public function Boss(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null; ) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package