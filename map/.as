//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	public class 
	{
		// The masterLayer contains every single object in this group making it easy to empty the level.
		public var masterLayer:FlxGroup = new FlxGroup;

		// This group contains all the tilemaps specified to use collisions.
		public var hitTilemaps:FlxGroup = new FlxGroup;
		// This group contains all the tilemaps.
		public var tilemaps:FlxGroup = new FlxGroup;

		public static var boundsMinX:int;
		public static var boundsMinY:int;
		public static var boundsMaxX:int;
		public static var boundsMaxY:int;

		public var boundsMin:FlxPoint;
		public var boundsMax:FlxPoint;
		public var bgColor:uint = 0;
		public var paths:Array = [];	// Array of PathData
		public var shapes:Array = [];	//Array of ShapeData.
		public static var linkedObjectDictionary:Dictionary = new Dictionary;

		public function () { }

		// Expects callback function to be callback(newobj:Object,layer:FlxGroup,level:BaseLevel,properties:Array)
		public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void { }

		public function addTilemap( mapClass:Class, imageClass:Class, xpos:Number, ypos:Number, tileWidth:uint, tileHeight:uint, scrollX:Number, scrollY:Number, hits:Boolean, collideIdx:uint, drawIdx:uint, properties:Array, onAddCallback:Function = null ):FlxTilemap
		{
			var map:FlxTilemap = new FlxTilemap;
			map.loadMap( new mapClass, imageClass, tileWidth, tileHeight, FlxTilemap.OFF, 0, drawIdx, collideIdx);
			map.x = xpos;
			map.y = ypos;
			map.scrollFactor.x = scrollX;
			map.scrollFactor.y = scrollY;
			if ( hits )
				hitTilemaps.add(map);
			tilemaps.add(map);
			if(onAddCallback != null)
				onAddCallback(map, null, this, scrollX, scrollY, properties);
			return map;
		}

		public function addSpriteToLayer(obj:FlxSprite, type:Class, layer:FlxGroup, xpos:Number, ypos:Number, angle:Number, scrollX:Number, scrollY:Number, flipped:Boolean = false, scaleX:Number = 1, scaleY:Number = 1, properties:Array = null, onAddCallback:Function = null):FlxSprite
		{
			if( obj == null )
				obj = new type(xpos, ypos);
			obj.x += obj.offset.x;
			obj.y += obj.offset.y;
			obj.angle = angle;
			if ( scaleX != 1 || scaleY != 1 )
			{
				obj.scale.x = scaleX;
				obj.scale.y = scaleY;
				obj.width *= scaleX;
				obj.height *= scaleY;
				// Adjust the offset, in case it was already set.
				var newFrameWidth:Number = obj.frameWidth * scaleX;
				var newFrameHeight:Number = obj.frameHeight * scaleY;
				var hullOffsetX:Number = obj.offset.x * scaleX;
				var hullOffsetY:Number = obj.offset.y * scaleY;
				obj.offset.x -= (newFrameWidth- obj.frameWidth) / 2;
				obj.offset.y -= (newFrameHeight - obj.frameHeight) / 2;
			}
			if( obj.facing == FlxObject.RIGHT )
				obj.facing = flipped ? FlxObject.LEFT : FlxObject.RIGHT;
			obj.scrollFactor.x = scrollX;
			obj.scrollFactor.y = scrollY;
			layer.add(obj);
			callbackNewData(obj, onAddCallback, layer, properties, scrollX, scrollY, false);
			return obj;
		}

		public function addTextToLayer(textdata:TextData, layer:FlxGroup, scrollX:Number, scrollY:Number, embed:Boolean, properties:Array, onAddCallback:Function ):FlxText
		{
			var textobj:FlxText = new FlxText(textdata.x, textdata.y, textdata.width, textdata.text, embed);
			textobj.setFormat(textdata.fontName, textdata.size, textdata.color, textdata.alignment);
			addSpriteToLayer(textobj, FlxText, layer , 0, 0, textdata.angle, scrollX, scrollY, false, 1, 1, properties, onAddCallback );
			textobj.height = textdata.height;
			textobj.origin.x = textobj.width * 0.5;
			textobj.origin.y = textobj.height * 0.5;
			return textobj;
		}

		protected function callbackNewData(data:Object, onAddCallback:Function, layer:FlxGroup, properties:Array, scrollX:Number, scrollY:Number, needsReturnData:Boolean = false):Object
		{
			if(onAddCallback != null)
			{
				var newData:Object = onAddCallback(data, layer, this, scrollX, scrollY, properties);
				if( newData != null )
					data = newData;
				else if ( needsReturnData )
					trace("Error: callback needs to return either the object passed in or a new object to set up links correctly.");
			}
			return data;
		}

		protected function generateProperties( ... arguments ):Array
		{
			var properties:Array = [];
			if ( arguments.length )
			{
				for( var i:uint = 0; i < arguments.length-1; i++ )
				{
					properties.push( arguments[i] );
				}
			}
			return properties;
		}

		public function createLink( objectFrom:Object, target:Object, onAddCallback:Function, properties:Array ):void
		{
			var link:ObjectLink = new ObjectLink( objectFrom, target );
			callbackNewData(link, onAddCallback, null, properties, objectFrom.scrollFactor.x, objectFrom.scrollFactor.y);
		}

		public function destroy():void
		{
			masterLayer.destroy();
			masterLayer = null;
			tilemaps = null;
			hitTilemaps = null;

			var i:uint;
			for ( i = 0; i < paths.length; i++ )
			{
				var pathobj:Object = paths[i];
				if ( pathobj )
				{
					pathobj.destroy();
				}
			}
			paths = null;

			for ( i = 0; i < shapes.length; i++ )
			{
				var shape:Object = shapes[i];
				if ( shape )
				{
					shape.destroy();
				}
			}
			shapes = null;
		}

		// List of null classes allows you to spawn levels dynamically from code using ClassReference.
		private static var level_Group1:Level_Group1;
	}
}
