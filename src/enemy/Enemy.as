package enemy 
{
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	public class Enemy extends FlxSprite
	{
		
		public function Enemy(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
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
		
		override public function update():void {
			super.update();
			worldBounds();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package