package enemy 
{
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	public class Enemy extends FlxSprite
	{
		
		public var activated:Boolean = false;
		protected var movePadX:Number = 0;
		protected var movePadY:Number = 0;
		
		public function Enemy(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		
		
		/** Force entity to remain inside the world bounds */
		
		protected function worldBounds():void {
			if (x < 0)
				x = 0;
			if (y < 0)
				y = 0;			
				
			if ((x + width) > FlxG.worldBounds.width)				
				x = FlxG.worldBounds.width - width;
			if ((y + height) > FlxG.worldBounds.height)
				y = FlxG.worldBounds.height - height;							
		}		
		
		override public function update():void {
			super.update();
		}
		
		/** Move the entity across the screen. currently the entity will move toward the player. If the movePadX or movePadY is set to greater than 0 values then it will take the padding into account before moving the entity. 
		 *   @param activated	once the player has been deemed in bounds and movePadX or movePadY was set then the conditions are met and movePad function is no longer checked. 
		 * */
		
		protected function move(speed:Number):void {
			
			if (activated || movePad()) {
				activated = true;
				velocity.x = 0;
				velocity.y = 0;
				
				if (Math.round(x) != Math.round(Registry.player.x)) {
					if (Registry.player.x < x)
						velocity.x = -speed;
					else if (Registry.player.x >= x)
						velocity.x = speed;			
				}
				else if (Math.round(y) != Math.round(Registry.player.y)) {
					if (Registry.player.y < y)
						velocity.y = -speed;
					else if (Registry.player.y >= y)
						velocity.y = speed;				
				}
			}
			else
				activated = false;
		}
		
		/** If movePadX or movePadY has a greater value than 0 then if the player is within that padding the entity will move 
		 *  @param movePadX	the X padding between entity and player before activation occurs
		 *  @param movePadY	the Y padding between entity and player before activation occurs
		 *  @param boundsX		if movePadX and movePadY are both set to greater than 0 values then boundsX determines if the function conditions for checking movePadY are valid otherwise it will return false
		 * */
		
		private function movePad():Boolean {
			if (movePadX == 0 && movePadY == 0) 
				return true;
				
			var boundsX:Boolean = false;
				
			if (movePadX != 0) {
				if (Registry.player.x > x)
					if (Registry.player.x < (x + movePadX)) {
						if (movePadY == 0)
							return true;
						else
							boundsX = true;
					}
				if (Registry.player.x < x)
					if (Registry.player.x > (x - movePadX)) {
						if(movePadY == 0)
							return true;
						else
							boundsX = true;
					}
			}
			
			if (boundsX || movePadX == 0) {
				if(movePadY != 0) {
					if (Registry.player.y > y)
						if (Registry.player.y < (y + movePadY)) {
							return true;
						}
					if (Registry.player.y < y)
						if (Registry.player.y > (y - movePadY)) {
							return true;
						}
				}
			}
			
			return false;
		}
		
		/** Select generic animations based on velocity values */
		
		protected function animate():void {
			if (velocity.x < 0) {
				play("left");
			}
			else if (velocity.x > 0) {
				play("right");
			}
			else if (velocity.y < 0) {
				play("up");
			}
			else if (velocity.y > 0) {
				play("down");
			}
			else 
				play("stand");
		}
		
		
		override public function destroy():void {
			super.destroy();
		}
		
	}//class
}//package