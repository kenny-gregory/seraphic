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
			if (!Dialog.active) {
				Dialog.write(this, new Array("Champion, are you okay? I saw you fall from the sky, but until now no one had the opportunity to find out what reasons or forces might have been behind this. One day long ago a man bearing the symbol of the pillars fell in this very place. His name was Hiraku! Before his journey began a army of darkness came for him and he has never been seen again. If you need any help from anyone in town your are more than ablidged to do so. You must hurry now.. If your situation turns out anything like the last sky angel then you will surely perish at the hands of the army of darkness. Oh yeah.. I almost forgot! Please watch out for the creatures spread across this land. Ever since the last sky angel we have been fighting creatures even inside our town!", 
															"Beware.. ever since the last hero disappeared it is common to see monsters even inside our towns. Talk to the elder he may have something for you to help you on your journey.", 
															"There is nothing more I can do or say to help you. May the blood scorpion bless you!",
															"Hurry! You have no time to wait. The army of darkness will know your here"
															), false, true, false, new Array(1, 2, 3));
			}
		}	
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package