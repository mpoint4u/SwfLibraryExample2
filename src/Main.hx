package ;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import openfl.Assets;
import format.SWF;
import openfl.display.FPS;
import openfl.Lib;

/**
 * ...
 * @author pm
 */

class Main extends Sprite 
{
	
	var cat:MovieClip; //To load MC from swf
	
	public function new () {
		super ();
		
		Lib.current.stage.frameRate = 24; //set frame 
		
		var swf = new SWF (Assets.getBytes ("assets/guywalk.swf"));
		
		cat = swf.createMovieClip ("GuyWalk"); 
		cat.height = Lib.current.stage.stageHeight;
		cat.width = Lib.current.stage.stageWidth;
		
		Lib.current.stage.addEventListener(Event.RESIZE, stage_onResize);

		addChild (cat);
		//addChild (new FPS ());
		addChildAt(new FPS(), 1);	
	}
	
	private function stage_onResize (event:Event):Void {
		
			trace("\nstage_onResize() was called...");
			trace("------------------------------");		

		cat.x = stage.stageWidth / 3;
		cat.y = stage.stageHeight / 3;
		
		cat.width = stage.stageWidth / 2;
			trace("MC Width is now ..." + cat.width);
			
		cat.height = stage.stageHeight / 2;
			trace("MC Height is now ..." + cat.height);
	} 
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
