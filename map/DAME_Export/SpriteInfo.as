//Code generated with DAME. http://www.dambots.com

package .DAME_Export
{
	public class SpriteInfo
	{
		var spriteList:Array = [];
		public function SpriteInfo():void
		{
			var spriteData:SpriteData;

			spriteData = new SpriteData("Wizard", "Wizard");
			spriteData.animData.push( new AnimData( "down",[0,1,2], 10.000, true ) );
			spriteData.animData.push( new AnimData( "left",[3,4,5], 10.000, true ) );
			spriteData.animData.push( new AnimData( "right",[6,7], 10.000, true ) );
			spriteData.animData.push( new AnimData( "up",[9,10,11], 10.000, true ) );
			spriteList.push( spriteData );

		}
	}
}
