//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	import enemy.*;
	import npc.*;
	import player.Player;
	import state.PlayState;
	
	public class Level1 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Group1_Ground.csv", mimeType="application/octet-stream")] public var CSV_Ground:Class;
		[Embed(source="../gfx/lostgarden.png")] public var Img_Ground:Class;
		[Embed(source="mapCSV_Group1_Collide.csv", mimeType="application/octet-stream")] public var CSV_Collide:Class;
		[Embed(source="../gfx/base_out_atlas.png")] public var Img_Collide:Class;

		//Tilemaps
		public var layerGround:FlxTilemap;
		public var layerCollide:FlxTilemap;

		//Sprites
		public var SpritesGroup:FlxGroup = new FlxGroup;

		//Paths
		public var PathsGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level1(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
		{
			// Generate maps.
			var properties:Array = [];
			var tileProperties:Dictionary = new Dictionary;

			properties = generateProperties( null );
			layerGround = addTilemap( CSV_Ground, Img_Ground, 0.000, 0.000, 20, 20, 1.000, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerCollide = addTilemap( CSV_Collide, Img_Collide, 0.000, 0.000, 32, 32, 1.000, 1.000, true, 2, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(PathsGroup);
			masterLayer.add(layerGround);
			masterLayer.add(SpritesGroup);
			masterLayer.add(layerCollide);

			if ( addToStage )
				createObjects(onAddCallback, parentObject);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 3840;
			boundsMaxY = 3744;
			boundsMin = new FlxPoint(0, 0);
			boundsMax = new FlxPoint(3840, 3744);
			bgColor = 0xff777777;
		}

		override public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void
		{
			addPathsForLayerPaths(onAddCallback);
			addSpritesForLayerSprites(onAddCallback);
			generateObjectLinks(onAddCallback);
			
			parentObject = (FlxG.state as PlayState).layer3;
			
			if ( parentObject != null ) {
				parentObject.add(PathsGroup);
				parentObject.add(layerGround);
				
				var playerLayer:Object = (FlxG.state as PlayState).layer4;
				playerLayer.add(SpritesGroup);	
				playerLayer.add(layerCollide);				
				
				playerLayer = null;
			}
			else
				FlxG.state.add(masterLayer);
		}

		public function addPathsForLayerPaths(onAddCallback:Function = null):void
		{
			var pathobj:PathData;

		}

		public function addSpritesForLayerSprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Wizard, SpritesGroup , 394.000, 127.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"type", value:"blue" }, null ), onAddCallback );//"Wizard"
			addSpriteToLayer(null, Wizard, SpritesGroup , 133.000, 251.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"type", value:"blue" }, null ), onAddCallback );//"Wizard"
			addSpriteToLayer(null, Wizard, SpritesGroup , 297.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"type", value:"blue" }, null ), onAddCallback );//"Wizard"
			addSpriteToLayer(null, player.Player, SpritesGroup , 141.000, 27.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Player"
			addSpriteToLayer(null, Bat, SpritesGroup , 312.000, 249.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Bat1"
			addSpriteToLayer(null, Bat, SpritesGroup , 227.000, 409.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Bat1"
			addSpriteToLayer(null, Bat, SpritesGroup , 487.000, 263.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Bat1"
			addSpriteToLayer(null, Princess, SpritesGroup , 27.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Princess1"
			addSpriteToLayer(null, PixelSprite, SpritesGroup , 114.000, 113.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { SimpleGraphic:Embed.deadTree1 }, null ), onAddCallback );//"DeadTree1"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
