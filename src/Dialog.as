package  
{
	
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxText;
	import state.PlayState;

	public class Dialog 
	{
		public static var text_sfx:FlxSound;
		
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
		
		
		public static function write(text:Array, method:String="single", repeat:Boolean = true, render:Boolean = true):void {			
			
			if (!text_sfx) {
				text_sfx = new FlxSound;
				text_sfx.loadEmbedded(Embed.textsfx, false, false);
			}
			
			loop = repeat;
			behavior = method;
			
			switch(behavior) {
				case "multiple":
					multiDialog = true;
					break;
				case "single":
					multiDialog = false;
					
				default:
					break;		
			}
			
			active = true;
			
			if(!multipleTextArrays) {
			
				textfield = new FlxText(50, 25, (FlxG.width * .75), "", false);
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
				
				
			if (behavior == "multiple") 
				textArray = multipleTextArrays[position];
			else
				textArray = multipleTextArrays[0];
			FlxG.stage.addEventListener(Event.ENTER_FRAME, update, false, 0, true);	
			(FlxG.state as PlayState).pause(render,  new Array(textfield));
		}
		
		public static function update(e:Event):void {
			if (!waitingOnUserInput) {
				if(textArray) {
					if (index < textArray.length) {
						textfield.text += textArray[index];
						text_sfx.play(false);
						index++;
					}
					else { 				
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
				waitingOnUserInput = false;		
				next();
			}
			index = 0;
		}
		
		private static function setTextFieldBounds():void {
			for(var i:int = 0; i < textArray.length; i++) {
				if (textfield.width > FlxG.width) {
					textfield.height += fontSize;
				}		
			}
		}
		
		public static function next():void {
			switch(behavior) {
				case "multiple":
					if (position >= (multipleTextArrays.length - 1)) {
						if(loop)
							position = 0;
					}
					else 
						position++;
						
					textfield.text = "";				
					textArray = multipleTextArrays[position];
					setTextFieldBounds();			
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
			if(textfield)
				textfield = null;
			if(multipleTextArrays) {
				multipleTextArrays.splice(0, multipleTextArrays.length);
				multipleTextArrays = null;
			}
			index = position = 0;
		}
		
		
	}//class
}//package