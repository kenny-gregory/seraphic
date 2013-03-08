package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import state.PlayState;
	
	public class Inventory 
	{
		public static var enabled:Boolean = false;
		private static var background:FlxSprite;
		private static var items:Array;
		private static var equipped:Array;
		public static var master:FlxGroup;
		
		public static function show():void {
			(FlxG.state as PlayState).pause(true, master.members);
			master.visible = true;
		}
		
		private static function create():void {
			master = new FlxGroup;
			background = new FlxSprite;
			background.loadGraphic(Embed.inventorybg, false, false, 300, 225, false);
			background.x = FlxG.width / 2 - background.width / 2;
			background.y = FlxG.height / 2 - background.height / 2;
			master.add(background);
			(FlxG.state as PlayState).layer6.add(master);
			master.visible = false;
		}
		
		public static function update():void {
			if (!master)
				create();	
			else {
				if (enabled && !master.visible)
					show();
				else if (!enabled && master.visible)
					hide();
			}
		}
		
		public static function hide():void {
			(FlxG.state as PlayState).unpause();			
			master.visible = false;
		}
		
		public static function add():void {
			
		}
		
		public static function remove():void {
			
		}
		
		public static function select():void {
			
		}
		
		public static function equip():void {
			
		}
		
		public static function destroy():void {
			background = null;
			items.splice(0);
			equipped.splice(0);
			master.members.splice(0);
			items = null;
			equipped = null;
			master = null;
			enabled = false;
		}		
		
	}//class
}//package