package state
{
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	public class MenuState extends FlxState
	{
		
		private var title:FlxText;
		private var play:FlxButton;
		private var options:FlxButton;		
		private var load:FlxButton;		
		private var help:FlxButton;
		
		private var itemOffsetY:Number = 25;
		
		override public function create():void {
			super.create();
			FlxG.mouse.show(null, 1);
			menuText();
			menuListeners();
		}
		
		private function menuListeners():void {
			
		}
		
		private function menuText():void {
			
			title = new FlxText(0, 0, 165, "seraphic", false);
			
			title.setFormat("Terminal", 24, 0x444444, "center", 0xCCCCCC);
			
			play = new FlxButton(0, 0, "play", playDown);
			options = new FlxButton(0, 0, "options", optionsDown);
			load = new FlxButton(0, 0, "load", loadDown);
			help = new FlxButton(0, 0, "help", helpDown);
			
			
			title.x = FlxG.width / 2 - title.width / 2;
			title.y = 30;
			play.x = FlxG.width / 2 - play.width / 2;
			play.y = FlxG.height / 3;
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