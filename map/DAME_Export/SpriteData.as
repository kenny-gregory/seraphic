//Code generated with DAME. http://www.dambots.com

package .DAME_Export
{
	import flash.utils.Dictionary;
	public class SpriteData
	{
		var animData:Array = [];	// AnimData
		var shapeList:Dictionary = new Dictionary;	// frame index => array of AnimFrameShapeList
		var className:String;
		var name:String;
		public function SpriteData( ClassName:String, Name:String ):void
		{
			className = ClassName;
			name = Name;
		}
	}
}
