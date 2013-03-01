package state 
{
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxState;
	import org.flixel.FlxText;	

	public class OverState extends FlxState
	{
		
		private var overText:FlxText;
		
		override public function create():void {
			super.create();
			overText = new FlxText(FlxG.width / 2 - (FlxG.width / 2), FlxG.height / 3, FlxG.width, "GAME OVER", false);
			overText.setFormat("Terminal", 18, 0xffffff, "center", 0xff333333);
			add(overText);
			music();
		}
		
		private function music():void {
			FlxG.music = new FlxSound;
			FlxG.music.loadEmbedded(Embed.music_over, false, true);
			FlxG.music.volume = .5;
			FlxG.music.play();			
		}				
		
		private function musicComplete():void {
			FlxG.switchState(new MenuState);
		}
		
		override public function update():void {
			super.update();	
			if (!FlxG.music.active)
				musicComplete();
		}
		
		override public function destroy():void {
			super.destroy();
			overText = null;
		}
		
	}//class
}//package