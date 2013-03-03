package state 
{
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;	

	public class OverState extends FlxState
	{
		
		private var gameOver:FlxSprite;
		
		override public function create():void {
			super.create();
			gameOver = new FlxSprite;
			gameOver.loadGraphic(Embed.over_gameover, false, false, 400, 300, false);
			gameOver.x = 0;
			gameOver.y = 0;
			add(gameOver);
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
			gameOver = null;
		}
		
	}//class
}//package