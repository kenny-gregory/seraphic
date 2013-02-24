package state 
{
	
	import org.flixel.FlxState;
	import org.flixel.FlxText;	

	public class OverState extends FlxState
	{
		
		override public function create():void {
			super.create();
			var text:FlxText = new FlxText(50, 50, 100, "OverState", true);
			add(text);			
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