//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	public class Level7 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="Level7.csv", mimeType="application/octet-stream")] public var CSV_Map3:Class;
		[Embed(source="../gfx/lostgarden.png")] public var Img_Map3:Class;

		//Tilemaps
		public var layerMap3:FlxTilemap;

		//Sprites
		public var Layer1Group:FlxGroup = new FlxGroup;

		//Paths
		public var Layer2Group:FlxGroup = new FlxGroup;

		//Properties


		public function Level7(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
		{
			// Generate maps.
			var properties:Array = [];
			var tileProperties:Dictionary = new Dictionary;

			properties = generateProperties( null );
			layerMap3 = addTilemap( CSV_Map3, Img_Map3, 0.000, 0.000, 20, 20, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(Layer1Group);
			masterLayer.add(Layer2Group);
			masterLayer.add(layerMap3);

			if ( addToStage )
				createObjects(onAddCallback, parentObject);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 2400;
			boundsMaxY = 2340;
			boundsMin = new FlxPoint(0, 0);
			boundsMax = new FlxPoint(2400, 2340);
			bgColor = 0xff777777;
		}

		override public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void
		{
			addPathsForLayerLayer2(onAddCallback);
			addSpritesForLayerLayer1(onAddCallback);
			generateObjectLinks(onAddCallback);
			if ( parentObject != null )
				parentObject.add(masterLayer);
			else
				FlxG.state.add(masterLayer);
		}

		public function addPathsForLayerLayer2(onAddCallback:Function = null):void
		{
			var pathobj:PathData;

		}

		public function addSpritesForLayerLayer1(onAddCallback:Function = null):void
		{
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
