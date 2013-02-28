package  
{
	
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	import state.PlayState;

	public class Dialog 
	{
		public static var loop:Boolean;
		public static var index:int = 0;
		public static var position:int = 0;
		public static var behavior:String;
		public static var multiDialog:Boolean = false
		public static var waitingOnUserInput:Boolean = false;
		
		public static var active:Boolean = false;
		private static var fontSize:int = 16;
		private static var textfield:FlxText;
		private static var textArray:Array;
		private static var multipleTextArrays:Vector.<Array>;
		private static var moreTextToDisplay:Boolean = false;
		
		
		public static function write(text:Array, method:String="normal", repeat:Boolean = true):void {			
			
			loop = repeat;
			behavior = method;
			
			switch(behavior) {
				case "multiple":
					multiDialog = true;
					break;
					
				default:
					break;		
			}
			
			active = true;
			
			if(!multipleTextArrays) {
			
				textfield = new FlxText(50, 50, (text[0].length * fontSize), "", false);
				(FlxG.state as PlayState).layer6.add(textfield);
				textfield.scrollFactor = new FlxPoint(0, 0);		
				
				for each(var textStrings:String in text) {
					
					textArray = new Array;					
					
					for (var i:int = 0; i < textStrings.length; i++) 
						textArray.push(textStrings.charAt(i));
					
						
					if (!multipleTextArrays)	
						multipleTextArrays = new Vector.<Array>;
						
					multipleTextArrays.push(textArray);
				}
			}
			else
				next();
				
				
			if (behavior == "multiple") {
				trace("multiple");
				textArray = multipleTextArrays[position];
			}
			else
				textArray = multipleTextArrays[0];
			FlxG.stage.addEventListener(Event.ENTER_FRAME, update, false, 0, true);	
			(FlxG.state as PlayState).pause(true, new Array(textfield));
			trace("pausing");
		}
		
		public static function update(e:Event):void {
			if (!waitingOnUserInput) {
				trace("updating");
				if(textArray) {
					if (index < textArray.length) {
						textfield.text += textArray[index];
						index++;
					}
					else { 				
						trace("waiting on user input");
						waitingOnUserInput = true;
						index = 0;
					}
				}
			}
			else {
				return;
			}
		}
		
		public static function resume():void {
			if (multiDialog) 
				clear();
			else {
				trace("resuming");
				waitingOnUserInput = false;		
				next();
			}
		}
		
		public static function next():void {
			switch(behavior) {
				case "multiple":
					if (position >= (multipleTextArrays.length - 1)) {
						if(loop)
							position = 0;
					}
					else {
						trace("position/multiple.len: " + position + "," + multipleTextArrays.length);
						position++;
					}
					textfield.text = "";				
					textArray = multipleTextArrays[position];
					textfield.width = textArray.length * fontSize;					
					return;
					break;
				default:
					if (multipleTextArrays.length > 1) {
						textfield.text = "";
						multipleTextArrays.splice(0, 1);						
						textArray = multipleTextArrays[0];
						textfield.width = textArray.length * fontSize;
					}					
					else
						clear(false);					
					break;
			}
		}
		
		public static function clear(removeListener:Boolean = true):void {	
			if (removeListener) 
				FlxG.stage.removeEventListener(Event.ENTER_FRAME, update);
			else {
				multipleTextArrays.splice(0, multipleTextArrays.length);		
				multipleTextArrays = null;
			}
			textArray = null;					
			textfield.text = "";
			active = false;							
			(FlxG.state as PlayState).unpause();
		}
		
		
		
		public static function destroy():void {
			clear();
			if(textfield)
				textfield = null;
			if(multipleTextArrays) {
				multipleTextArrays.splice(0, multipleTextArrays.length);
				multipleTextArrays = null;
			}
		}
		
		
	}//class
}//package