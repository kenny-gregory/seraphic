package state
{
	
	import org.flixel.FlxSound;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class MenuState extends FlxState
	{
		
		private var title:FlxSprite;
		
		private var play:FlxButton;
		private var options:FlxButton;		
		private var load:FlxButton;		
		private var help:FlxButton;
		
		private var itemOffsetY:Number = 35;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show(null, 1);
			title = new FlxSprite;
			title.loadGraphic(Embed.menu_title, false, false, 400, 300, false);
			title.x = 0;
			title.y = 0;			
			menuText();			
			menuListeners();
			music();
		}
		
		private function music():void {
			FlxG.music = new FlxSound;
			FlxG.music.loadEmbedded(Embed.music_menu, true, false);
			FlxG.music.volume = .5;
			FlxG.music.play();			
		}		
		
		private function menuListeners():void {
			
		}
		
		private function menuText():void {
			
			play = new FlxButton(0, 0, "play", playDown);
			options = new FlxButton(0, 0, "options", optionsDown);
			load = new FlxButton(0, 0, "load", loadDown);
			help = new FlxButton(0, 0, "help", helpDown);
			
			
			play.x = FlxG.width / 2 - play.width / 2;
			play.y = FlxG.height / 2.75;
			options.x = FlxG.width / 2 - options.width / 2;
			options.y = play.y + itemOffsetY;			
			load.x = FlxG.width / 2 - load.width / 2;;
			load.y = options.y + itemOffsetY;
			help.x = FlxG.width / 2 - help.width / 2;
			help.y = load.y + itemOffsetY;
			
			add(title);
			add(play);
			add(options);			
			add(load);
			add(help);
		}
		
		private function playDown():void {
			FlxG.switchState(new PlayState);
		}
		
		private function optionsDown():void {
			FlxG.switchState(new OptionState);
		}
		
		private function loadDown():void {
			FlxG.switchState(new LoadState);
		}
		
		private function helpDown():void {
			FlxG.switchState(new HelpState);
		}		
		
		override public function update():void {
			super.update();
		}
		
		override public function destroy():void {
			super.destroy();
			title = null;
			play = null;
			options = null;
			load = null;
			help = null;
		}
		
	}//class
}//package