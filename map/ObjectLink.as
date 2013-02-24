package 
{
	public class ObjectLink
	{
		public var fromObject:Object;
		public var toObject:Object;
		public function ObjectLink(from:Object, to:Object)
		{
			fromObject = from;
			toObject = to;
		}

		public function destroy():void
		{
			fromObject = null;
			toObject = null;
		}
	}
}
