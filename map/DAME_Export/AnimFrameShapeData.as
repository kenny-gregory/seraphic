//Code generated with DAME. http://www.dambots.com

package .DAME_Export
{
	public class AnimFrameShapeData
	{
		public var name:String;
		public var x:int;
		public var y:int;
		public var type:int;
		public var width:int = 0;
		public var height:int = 0;
		public var radius:int = 0;
		public static const SHAPE_POINT:uint = 0;
		public static const SHAPE_BOX:uint = 1;
		public static const SHAPE_CIRCLE:uint = 2;
		public function AnimFrameShapeData( Name:String, Type:int, X:int, Y:int, Radius:int, Wid:int, Ht:int ):void
		{
			name = Name;
			type = Type;
			x = X;
			y = Y;
			radius = Radius;
			width = Wid;
			Ht = Ht;
		}
	}
}
