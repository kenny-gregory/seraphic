package  
{
	import org.flixel.FlxSprite;
	
	public class PixelSprite extends FlxSprite
	{
		
		public function PixelSprite(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null ) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(Embed.deadTree1, false, false, 100, 100, false);
			Groups.pixelPerfect.add(this);
		}
		
		
	}//class
}//package