//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Simple Custom Solutions Corp.
// 
////////////////////////////////////////////////////////////////////////////////

package com.artiphany.ViewEcard.views.components
{
import flash.display.MovieClip;
import flash.text.TextField;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFormat;
import com.greensock.TweenLite;
import com.greensock.loading.ImageLoader;
import com.greensock.events.LoaderEvent;
import com.greensock.easing.Expo;

/**
 * Class.
 * 
 * @langversion ActionScript 3.0
 * @playerversion Flash 9.0
 * 
 * @author ignacio david palladino
 * @since  15.10.2011
 */
public class GeneralButton extends MovieClip
{
	
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------

	public static const GENERAL_BUTTON_HEIGHT:Number = 40;
	public static const GENERAL_BUTTON_WIDTH:Number = 130;
	public static const GENERAL_BUTTON_COLOR:Number = 0x49D02C;
	public static const GENERAL_BUTTON_TEXT_COLOR:Number = 0xFFFFFF;
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	
	private var _labelValue:String;
	private var _background:Number;
	private var _width:Number;
	private var _height:Number;
	
	private var _label:TextField;
	private var _border:Sprite;
	
	private const PADDING:Number = 30;
	
	//--------------------------------------
	//  CONSTRUCTOR
	//--------------------------------------
	
	/**
	 * @constructor
	 */
	public function GeneralButton(label:String, 
	                                background:Number = GENERAL_BUTTON_COLOR, 
	                                width:Number = -1, 
	                                height: Number = GENERAL_BUTTON_HEIGHT,
	                                image:String = null)
	{
		super();
		_width = width;
		_height = height;
		
		if(image != null) {
		    //create an ImageLoader:
		    trace("GeneralButton.constructor: trying to load image " + image);
            var loader:ImageLoader = new ImageLoader(image, {name:image, container:this, x:0, y:0, /*width:200, height:150,*/ scaleMode:"proportionalInside", centerRegistration:true, onComplete:onImageLoad});

            //begin loading
            loader.load();

		}
		else
		    createButton(label, background, width, height);
		
		
		this.buttonMode = true;
        this.mouseChildren = false;
        this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        vanish();
	}
	
	//--------------------------------------
	//  GETTER/SETTERS
	//--------------------------------------
	
	//--------------------------------------
	//  PUBLIC METHODS
	//--------------------------------------
	
	public function increaseBackSize(): void {
	    _border.width += 20;
	}
	
	public function decreaseBackSize(): void {
	    _border.width = _width;
	}
	
	public function onMouseOut(e:MouseEvent): void {
	    vanish();
	}
	
	public function onMouseOver(e:MouseEvent): void {
	    TweenLite.to(this, 0.5, {alpha:1, ease:Expo.easeOut});
	}
	
	public function vanish(): void {
	    TweenLite.to(this, 0.5, {alpha:.4, ease:Expo.easeOut});
	}
	
	public function set text(value:String): void {
	    _label.text = value;
	}
	
	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------
	
	public function onImageLoad(event:LoaderEvent):void {
    	TweenLite.from(event.target.content, 1, {alpha:0});
    }
	
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	
	private function createButton(label:String, background:Number, width:Number, height:Number): void {
	    
        
        _label = new TextField();
        _label.autoSize = 'left';
	    //_label.width = width;
	    //_label.y = height/2 - _label.height;
	    
	    var myTextFormat:TextFormat = new TextFormat();
		myTextFormat.font = "Arial";
        myTextFormat.size = 12;
        myTextFormat.color = GENERAL_BUTTON_TEXT_COLOR;
        myTextFormat.align = 'center';
        myTextFormat.bold = true;
        _label.defaultTextFormat = myTextFormat;        
        _label.text = label;
        
        _border = new Sprite();
        addChild(_border);
        _border.graphics.lineStyle();
        _border.graphics.beginFill(background, 1);
        if(width == -1) {
            _border.graphics.drawRoundRect(0,0, _label.width + PADDING, height, 8);
            _label.x = (_label.width + PADDING)/2 - _label.width/2;
            _width = _label.width + PADDING;
        }
        else {
            _border.graphics.drawRoundRect(0,0, width, height, 8);
            _label.x = (width)/2 - _label.width/2;
        }
        _border.graphics.endFill();
        
        
        _label.y = _height/2 - _label.height/2;
        addChild(_label); 
	}
	
	override public function get height(): Number
	{
	    return _height;
	}
	
	public function showBackground(value:Boolean) {
	    _border.visible = value;
	}
	
}

}