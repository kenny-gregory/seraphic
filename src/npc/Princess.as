package npc 
{
	
	import org.flixel.FlxSprite;

	public class Princess extends NPC
	{
		
		public function Princess(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(Embed.princess1, true, false, 32, 32, false);
			addAnimation("down", [0, 1, 2], 10.000, true);
			addAnimation("left", [3, 4, 5], 10.000, true);
			addAnimation("right", [6, 7], 10.000, true);
			addAnimation("up", [9, 10, 11], 10.000, true);
			
			immovable = true;
			moves = false;
		}
		
		override public function update():void {
			super.update();
		}
		
		public function showDialog():void {
			if (!Dialog.active) 
				Dialog.write("hello you are a champion!");
		}	
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package