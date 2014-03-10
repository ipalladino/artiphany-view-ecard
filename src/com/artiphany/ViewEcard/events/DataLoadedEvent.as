//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 Simple Custom Solutions Corp.
// 
////////////////////////////////////////////////////////////////////////////////

package com.artiphany.ViewEcard.events
{

import flash.events.Event;

/**
 * Event subclass.
 * 
 * @langversion ActionScript 3.0
 * @playerversion Flash 9.0
 * 
 * @author ignacio david palladino
 * @since  08.11.2011
 */
public class DataLoadedEvent extends Event
{
	
	//--------------------------------------
	// CLASS CONSTANTS
	//--------------------------------------
	
	public static const EVENT_NAME:String = "dataLoadedEvent";
	private var _data:Object;
	//--------------------------------------
	//  CONSTRUCTOR
	//--------------------------------------
	
	/**
	 *	@constructor
	 */
	public function DataLoadedEvent(data:Object, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(EVENT_NAME, bubbles, cancelable);
		_data = data;
		
	}
	
	//--------------------------------------
	//  GETTER/SETTERS
	//--------------------------------------
	
	public function get data():Object {
	    return _data;
	}
	
	//--------------------------------------
	//  PUBLIC METHODS
	//--------------------------------------

	override public function clone():Event
	{
		return new DataLoadedEvent(data, bubbles, cancelable);
	}
	
	//--------------------------------------
	//  EVENT HANDLERS
	//--------------------------------------
	
	//--------------------------------------
	//  PRIVATE VARIABLES
	//--------------------------------------
	
	//--------------------------------------
	//  PRIVATE & PROTECTED INSTANCE METHODS
	//--------------------------------------
	
}

}

