package 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	public class PathData
	{
		public var nodes:Array;
		public var isClosed:Boolean;
		public var isSpline:Boolean;
		public var layer:FlxGroup;

		// These values are only set if there is an attachment.
		public var childSprite:FlxSprite = null;
		public var childAttachNode:int = 0;
		public var childAttachT:Number = 0;	// position of child between attachNode and next node.(0-1)

		public function PathData( Nodes:Array, Closed:Boolean, Spline:Boolean, Layer:FlxGroup )
		{
			nodes = Nodes;
			isClosed = Closed;
			isSpline = Spline;
			layer = Layer;
		}

		public function destroy():void
		{
			layer = null;
			childSprite = null;
			nodes = null;
		}
	}
}
