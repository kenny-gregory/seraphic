package state 
{
	
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxState;
	import org.flixel.FlxText;	

	public class OverState extends FlxState
	{
		
		override public function create():void {
			super.create();
			var text:FlxText = new FlxText(50, 50, 100, "OverState", true);
			add(text);			
			music();
		}
		
		private function music():void {
			FlxG.music = new FlxSound;
			FlxG.music.loadEmbedded(Embed.music_over, false, true);
			FlxG.music.volume = .5;
			FlxG.music.play();			
		}				
		
		override public function update():void {
			super.update();	
			Registry.stateSwitch();
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package