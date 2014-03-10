//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Simple Custom Solutions Corp.
// 
////////////////////////////////////////////////////////////////////////////////

package com.artiphany.ViewEcard.views
{

import flash.display.MovieClip;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.SWFLoader;
import com.artiphany.ViewEcard.Settings.GeneralSettings;
import com.greensock.events.LoaderEvent;
import com.artiphany.ViewEcard.views.Preloader;

/**
 * Class.
 * 
 * @langversion ActionScript 3.0
 * @playerversion Flash 9.0
 * 
 * @author ignacio david palladino
 * @since  08.11.2011
 */
public class MainStage extends MovieClip
{
    //--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------

    public static const ANIMATIONS_URL:String = "http://www.simplecustomsolutions.com/animations/"
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------

	public var tag:String = "Preview";
	private var _cancelled:Boolean;
	private var _loader:Preloader;
	private var _animation:MovieClip;
	private var _data:Object;
	private var _queue:LoaderMax;

	//--------------------------------------
	//  CONSTRUCTOR
	//--------------------------------------

	/**
	 * @constructor
	 */
	public function MainStage(data:Object)
	{
	    _data = data;
		_loader = new Preloader();
		addChild(_loader);
		_loader.x = GeneralSettings.APP_WIDTH/2;
        _loader.y = GeneralSettings.APP_HEIGHT - 50;
        _loader.visible = false;
        _animation = new MovieClip();
        addChild(_animation);
	}

	//--------------------------------------
	//  PUBLIC METHODS
	//--------------------------------------

	public function loadAnimation():void {
	    var filename:String;
	    if(_data.ecard_id == 1) {
	        filename = "MQbday.swf"
	    } 
	    else if(_data.ecard_id == 4) {
	        filename = "chrtale.swf"
	    }
	    else if(_data.ecard_id == 3) {
	        filename = "catbroom.swf"
	    }
	    else if(_data.ecard_id == 2) {
	        filename = "catbroom.swf"
	    }
	    else if(_data.ecard_id == 5) {
	        filename = "spreadwings_eng.swf"
	    }
	    else if(_data.ecard_id == 6) {
	        filename = "spreadwings_ara.swf"
	    }
	    else if(_data.ecard_id == 7) {
	        filename = "spreadwings_man.swf"
	    }
	    else if(_data.ecard_id == 8) {
	        filename = "spreadwings_spa.swf"
	    }
	    else if(_data.ecard_id == 9) {
	        filename = "leapoflove.swf"
	    }
	    else if(_data.ecard_id == 10) {
	        filename = "makemepurr.swf"
	    }
	    else if(_data.ecard_id == 11) {
	        filename = "bugcurtsy.swf"
	    }
	    _queue = new LoaderMax({name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
	    _queue.append( new SWFLoader(ANIMATIONS_URL + filename, {name:"childClip", estimatedBytes:17000, container:_animation, autoPlay:true, onInit:onInitHandler}) );
	    _queue.load();
	    //add preloader
        _loader.visible = true;
    }

    public function cancelAnimation(): void {
        _queue.unload();
        _loader.visible = false;
    }

	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------

	private function onInitHandler(event:LoaderEvent): void {
        var animation:MovieClip = MovieClip(event.target.rawContent);
        //animation.message1.text = _data.recipientname;
        animation.message2 = _data.message1;
        animation.message3 = _data.message2;
        
    }

    private function progressHandler(event:LoaderEvent):void {
        //trace("progress: " + event.target.progress);
        //_animation.bytes.text = Math.round(e.bytesLoaded/1000) + " out of " + Math.round(e.bytesTotal/1000) + " Kbytes";
    }

    private function completeHandler(event:LoaderEvent):void {
        //trace(event.target + " is complete!");
    }

    private function errorHandler(event:LoaderEvent):void {
        //trace("error occured with " + event.target + ": " + event.text);
    }	

    //--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------

    //--------------------------------------
	//  GETTER/SETTERS
	//--------------------------------------
}

}