package weapon 
{
	import enemy.Wizard;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;

	public class Weapon 
	{
		
		public static var playerBullets:FlxGroup;
		
		public static function shoot(source:FlxObject, className:Class):void {
			
		}
		
		public static function player(currentWeapon:Class):void {
			if (FlxG.keys.justPressed("SPACE")) {
				if (!playerBullets) 
					playerBullets = new FlxGroup(15);
					
				var b:* = playerBullets.getFirstAvailable() as currentWeapon;
				if (!b) {
					b = new currentWeapon;
					playerBullets.add(b);
				}
				else {
					b.shoot();
				}
			}
			if(Groups.wizards && playerBullets && playerBullets.getFirstExtant())
				FlxG.overlap(playerBullets, Groups.wizards, null, playerBulletOverlap);
		}
		
		private static function playerBulletOverlap(pB:*, w:Wizard):void {
			w.flicker(.25);
			w.hurt(1);
			pB.exists = false;
		}
		
		public static function destroy():void {
			if (playerBullets)
				playerBullets.members.splice(0);
		}
		
	}//class
}//package