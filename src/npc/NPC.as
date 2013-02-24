package npc 
{
	
	import org.flixel.FlxSprite;

	public class NPC extends FlxSprite
	{
		
		public function NPC(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null; ) 
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