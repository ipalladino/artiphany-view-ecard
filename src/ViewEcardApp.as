//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 
// 
////////////////////////////////////////////////////////////////////////////////

package
{

import flash.events.Event;
import flash.display.Sprite;
import com.artiphany.ViewEcard.controllers.Controller;
import flash.display.LoaderInfo;
import flash.text.TextField;
import com.artiphany.ViewEcard.events.DataLoadedEvent;
import com.artiphany.ViewEcard.views.MainStage;
import flash.events.MouseEvent;
import flash.display.StageDisplayState;
import com.artiphany.ViewEcard.views.components.GeneralButton;
import flash.events.FullScreenEvent;

/**
 * Application entry point for AS3Project.
 * 
 * @langversion ActionScript 3.0
 * @playerversion Flash 9.0
 * 
 * @author ignacio david palladino
 * @since 08.11.2011
 */
public class ViewEcardApp extends Sprite
{
	
	/**
	 * @constructor
	 */
	 
	 private var _controller:Controller;
	 private var _fullscreenButton:GeneralButton;
	
	public function ViewEcardApp()
	{
		super();
		stage.addEventListener( Event.ENTER_FRAME, initialize );
	}

	/**
	 * Initialize stub.
	 */
	private function initialize(event:Event):void
	{
	    stage.addEventListener(Event.FULLSCREEN, fullScrHandler);
		stage.removeEventListener( Event.ENTER_FRAME, initialize );
		trace( "AS3Project::initialize()" );
		_controller = new Controller();
		_controller.addEventListener(DataLoadedEvent.EVENT_NAME, dataLoadedHandler)
		getCode();
	}
	
	private function getCode():void {
	    trace("Controller.getCode");
	    try 
        {
            var keyStr:String;
            var valueStr:String;
            var paramObj:Object = LoaderInfo(this.root.loaderInfo).parameters;//set the paramObj variable to the parameters property of the LoaderInfo object
            trace(paramObj.code);
            var textasd:TextField = new TextField();
            addChild(textasd);
            if(paramObj.code != null)
                textasd.text = paramObj.code;
            else
                textasd.text = "No code set";
            
            _controller.requestData(paramObj.code);

        } 

        catch (error:Error) 
        {
            trace(error.toString());
        }
	}
	
	private function dataLoadedHandler(e:DataLoadedEvent): void {
	    var mainStage:MainStage = new MainStage(e.data);
	    mainStage.loadAnimation();
	    addChild(mainStage);
	    mainStage.addEventListener(MouseEvent.CLICK, _handleClick)
		mainStage.buttonMode = true;
        mainStage.mouseChildren = false;
	    mainStage.x = 0;
	    mainStage.y = 0;
	    
	    _fullscreenButton = new GeneralButton("VISUAL DELIGHT");
	    addChild(_fullscreenButton);
	    _fullscreenButton.addEventListener(MouseEvent.CLICK, fullscreenButtonHandler);
	    _fullscreenButton.y = 10;
	    _fullscreenButton.x = 10;  
	}
	
	private function fullscreenButtonHandler(e:MouseEvent): void {
	    goFullScreen();
	}
	
	private function goFullScreen():void
    {
        if (stage.displayState == StageDisplayState.NORMAL) {
            stage.displayState = StageDisplayState.FULL_SCREEN;
            _fullscreenButton.visible = false;
        }
        else {
            _fullscreenButton.visible = true; 
            stage.displayState = StageDisplayState.NORMAL;
        }
    }
    
    function fullScrHandler(event:FullScreenEvent):void {
        if (stage.displayState == StageDisplayState.FULL_SCREEN) {
    		//_fullscreenButton.visible = false;
    	} else {
    		_fullscreenButton.visible = true;
    	}
    }

    private function _handleClick(event:MouseEvent):void
    {
        goFullScreen();
    }
}

}