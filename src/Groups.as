package  
{
	import org.flixel.FlxGroup;

	public class Groups 
	{
		public static var enemy:FlxGroup = new FlxGroup;
		public static var wizards:FlxGroup = new FlxGroup;
		public static var bats:FlxGroup = new FlxGroup;
		public static var npc:FlxGroup = new FlxGroup;
		public static var pixelPerfect:FlxGroup = new FlxGroup;
		
		public static function create():void {
			enemy.add(wizards);
			enemy.add(bats);
		}
		
		public static function destroy():void {
			enemy.members.splice(0);
			wizards.members.splice(0);
			bats.members.splice(0);
			npc.members.splice(0);
			pixelPerfect.members.splice(0);
		}
		
	}//class
}//package