package npc 
{
	
	import org.flixel.FlxSprite;

	public class NPC extends FlxSprite
	{
		
		public var dialogActive:Boolean = false;		
		
		public function NPC(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			Groups.npc.add(this);
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package