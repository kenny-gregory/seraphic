package 
{
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import state.PlayState;

	public class Dialog
	{
		
		/** If the Dialog is currently being executed */
		public static var active:Boolean = false;
		/** Contains all 'added' objects */
		public static var master:FlxGroup;		
		/** The padding for the textfield's appearance on the dialog background. */
		public static var pad:FlxPoint = new FlxPoint(10, 10);
		/** The graphical border or message box asset. */
		public static var background:FlxSprite;
		/** Picture generally of the speaker in the conversation */
		public static var thumbnail:FlxSprite;
		/** The message text */
		public static var textfield:FlxText;
		/** Sound effect for each character in the message being displayed */
		public static var sfx:FlxSound;
		/** Waiting on user input through the keyboard */
		public static var waitingOnKey:Boolean = false;
		/** Enable thumbnails */
		public static var thumb:Boolean;
		/** Cycle back through the conversation once it has completed the initial cycle. */
		public static var cycle:Boolean;
		/** Completed the initial cycle */
		public static var completedCycle:Boolean = false;
		/** Items to be repeated in the order defined once the initial cycle is completed */
		public static var loopArray:Array;
		/** Storage of the conversations and their owners */
		public static var interactions:Dictionary;
		/** Position of message index in the conversation specific to the owner */
		public static var positions:Dictionary;
		/** Copy of the conversation which is the one that is manipulated in the code of this class */
		public static var conversation:Array;
		/** The object who requested the conversation */
		public static var owner:FlxObject;
		/** Current message to display */
		public static var message:String;
		/** Current character position in the message */
		public static var messagePosition:int = 0;
		/** Last Parent */
		public static var lastParent:FlxObject;
		
		public static var thumbIndex:int;
		
		/** 
		 *  Write a message to be displayed in dialog format. Uses include but not limited to:  NPC, story, cutscene, credits.
		 * 
		 *  @param parent	The source object that called the write method. Used when returning to store conversations.
		 *  @param text	Can include single or multiple messages of any length.
		 *  @param repeat	Keep messages stored and restart them from the beginning once all messages have been displayed.
		 *  @param renderState Perform the state's render. If set to false then only the text will be displayed on the screen.
		 *  @param enableThumb Enable the use of thumbnails in the dialog. Generally this would be a picture of the person currently speaking in the conversation.
		 *  @param loop Specify the message numbers of the conversation as they are arranged in the text parameter in any order and they will be looped after the initial conversation is completed.
		 * 
		 */
		public static function write(parent:FlxObject, text:Array, repeat:Boolean = true, renderState:Boolean = true, enableThumb:Boolean = false, thumbnailIndex:int = -1, loop:Array = null):void {
			// prevent multiple collisions triggering dialog from the same instance
			if (active)
				return;
				
			// dialog is now active to prevent unwanted behavior
			active = true;
			// set current parent object
			owner = parent;
			// set to use a thumbnail in messagebox
			thumb = enableThumb;
			// the portrait to use if thumb is enabled
			thumbIndex = thumbnailIndex;			
			// remove message after it is displayed
			cycle = repeat;
			// set repeat to false if loop is defined since the repeat process will be interrupted/overridden by the loop
			if (loop && loop.length > 0 && repeat)
				repeat = false;
			// after messages are cycled if loop is not null the messages identified by loop array will be looped
			loopArray = loop;
			
			// reset conversation if parent of conversation changed
			if (!lastParent || parent != lastParent) {
				conversation = null;
				lastParent = parent;
			}
			
			layout();
			(FlxG.state as PlayState).pause(renderState, new Array(textfield));
			
			// if state changed or initial creation then instantiate the dictionaries
			if(!interactions) {
				interactions = new Dictionary(true)
				positions = new Dictionary(true);	
			}
			
			// reset the conversation on a new write incase we are speaking with a different parent speaker
			
			// store interaction texts if none exists for parent
			if (!interactions[parent]) {
				interactions[parent] = text;
				// set parent position to keep track of line to display
				positions[parent] = 0;		
			}
			
			next();			
		}
		
		/** Handle the next message in the conversation if one exist */
		private static function next():void {
			messagePosition = 0;
			
			// store the conversation of the specific parent 'speaker'
			if (!conversation) {
				conversation = new Array;
				conversation = interactions[owner];
			}
			// if loop is defined set the message position according to the loop values
			if (completedCycle && (loopArray && loopArray.length > 0))
				message = conversation[ loopArray[positions[owner]] ];
			else
				message = conversation[positions[owner]];
				
			// if message does not exist or all messages have been finalized then ignore dialog request
			if (!message) {
				clear();
				(FlxG.state as PlayState).unpause();
				return;				
			}
				
			// if not cycling remove message completely after being displayed
			if (!cycle && !completedCycle) { 
				// if loop array is defined and message is not contained within loops to be looped or if loop array is not defined then null message from queue
				if((loopArray && loopArray.indexOf(positions[owner], 0) < 0) || !loopArray)
					conversation[positions[owner]] = null;
			}	
			positions[owner]++;					
			FlxG.stage.addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		
		/** Create the layout for the Dialog */
		private static function layout():void {
			if(!background) {
				background = new FlxSprite;
				background.loadGraphic(Embed.messagebox_teal, false, false, 318, 78, false);
				background.x = (FlxG.width - background.width) / 2;
				background.y = (FlxG.height / 2);
			}
			else
				background.visible = true;
				
			if (thumb && thumbIndex >= 0) {
				thumbnail = null;
				thumbnail = new FlxSprite;
				thumbnail.loadGraphic(Embed.thumbnail_faces, true, false, 48, 48, false);					
				thumbnail.x = background.x + pad.x;
				thumbnail.y = background.y + pad.y;
				// load specific portrait
				thumbnail.addAnimation("portrait", [thumbIndex], 0, false);
				thumbnail.play("portrait");			
				thumbnail.visible = true;
			}
			
			if (!textfield) {
				if(thumbnail && thumbIndex >= 0) // TODO: fix math below to something more simple
					textfield = new FlxText((background.x + ((pad.x * 4) + thumbnail.width / 2)), (background.y + (pad.y * 1.5)), (background.width - (pad.x * 4) - thumbnail.width), null, false);
				else
					textfield = new FlxText((background.x + pad.x), (background.y + pad.y), background.width - (pad.x * 2), null, false);
				
				textfield.setFormat("Terminal", 6, 0xffffff, "left", 0xFF000000);
			}
			else
				textfield.visible = true;
			
			if (!master) {
				master = new FlxGroup;				
				master.add(background);
				master.add(textfield);
				(FlxG.state as PlayState).layer6.add(master);
			}
			
			// add thumbnail to the display list through master if its not already present in master
			if (thumb) {
				if(master.members.indexOf(thumbnail, 0) < 0)
					master.add(thumbnail);			
			}
			
			if(!sfx) {
				sfx = new FlxSound;
				sfx.loadEmbedded(Embed.textsfx, false, false);
			}
			
			// scroll factor
			background.scrollFactor.x = background.scrollFactor.y = 0;
			thumbnail.scrollFactor.x = thumbnail.scrollFactor.y = 0;
			textfield.scrollFactor.x = textfield.scrollFactor.y = 0;
			
		}
		
		/** Update the dialog */
		private static function update(e:Event):void {
			if (active) {
				// waiting for key to continue
				if (!waitingOnKey) {
					// allow player to abort dialog
					if (FlxG.keys.justPressed("ENTER")) {
						clear();						
						(FlxG.state as PlayState).unpause();
						return;
					}
					if(messagePosition < message.length) {
						textfield.text += message.charAt(messagePosition);
						messagePosition++;
						sfx.play(false);
					}
					else {
						waitingOnKey = true;
					}
					if (textfield.height >= (background.height - (pad.y * 4))) {
						// if the last character displayed in the message was a space so that the word does not get split.
						if(textfield.text.charAt(textfield.text.length - 1) == " ") {
							waitingOnKey = true;
							textfield.text += "..... press enter to read more!";
						}
					}
					else { } // next message
				}
				// waiting on key
				else {
					if (FlxG.keys.justPressed("ENTER")) {
						textfield.text = "";						
						waitingOnKey = false;
						if (messagePosition >= message.length) {
							clear();
							(FlxG.state as PlayState).unpause();
							return;							
						}
					}
				}
			}
		}
		
		/** Clear or reset the conversation properties */
		private static function clear():void {
			FlxG.stage.removeEventListener(Event.ENTER_FRAME, update);				
			if(background)
				background.visible = false;
			if(thumbnail)
				thumbnail.visible = false;
			if(textfield)
				textfield.visible = false;
				
			// switch to position of loop items instead of position of conversation
			if (completedCycle) {
				if(loopArray) {
					if (positions[owner] >= loopArray.length)
						positions[owner] = 0;
				}
			}
			// reset position of conversation messages
			else if (positions[owner] >= conversation.length) {
				completedCycle = true;
				if(cycle)
					positions[owner] = 0;		
				else
					positions[owner]--;
			}
				
			textfield.text = "";				
			active = false;	
			message = null;
			messagePosition = 0;		
			waitingOnKey = false;
		}
		
		/** Remove any references used in the Dialog class. */
		public static function destroy():void {
			if(background)
				background = null;
			if(thumbnail)
				thumbnail = null;
			if(textfield)
				textfield = null;
			if(master)
				master = null;
				
			sfx = null;
			loopArray.splice(0);			
			loopArray = null;
			interactions = null;
			positions = null;
			conversation.splice(0);
			conversation = null;
			owner = null;
			messagePosition = 0;
			active = false;
			waitingOnKey = false;
			completedCycle = false;
		}	
		
		
	}//class
}//package