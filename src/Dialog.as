package  
{
	
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	import state.PlayState;

	public class Dialog 
	{
		public static var active:Boolean = false;
		private static var fontSize:int = 16;
		private static var textfield:FlxText;
		private static var textArray:Array;
		private static var moreTextToDisplay:Boolean = false;
		
		
		public static function write(text:String):void {			
			active = true;
			textfield = new FlxText(50, 50, (text.length * fontSize), "", false);
			(FlxG.state as PlayState).layer6.add(textfield);
			textfield.scrollFactor = new FlxPoint(0, 0);
			
			if (!textArray)
				textArray = new Array;
			for (var i:int = 0; i < text.length; i++) {
				textArray.push(text.charAt(i));
			}
			FlxG.stage.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			(FlxG.state as PlayState).pause(true, new Array(textfield));			
		}
		
		public static function update(e:Event):void {
			if (textArray.length > 0) {
				textfield.text += textArray[0];
				textArray.splice(0,1);
			}
		}
		
		public static function clear():void {
			FlxG.stage.removeEventListener(Event.ENTER_FRAME, update);
			textArray.splice(0);
			textArray = null;
			textfield.text = "";
			active = false;
		}
		
		
		
		public static function destroy():void {
			clear();
			textfield = null;
		}
		
	}//class
}//package