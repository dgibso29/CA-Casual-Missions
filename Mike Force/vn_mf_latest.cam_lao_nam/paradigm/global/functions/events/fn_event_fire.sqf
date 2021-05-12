/*
    File: fn_event_fire.sqf
    Author: Spoffy
    Date: 2020-10-08
    Last Update: 2020-10-08
    Public: Yes
    
    Description:
		Immediately fires the named event with the given parameters.
    
    Parameter(s):
		_eventName - Name of the event to fire [STRING]
		_eventParams - Parameters to pass to event handler [ANY]
    
    Returns:
		None
    
    Example(s):
*/
params ["_eventName", "_eventParams"];

private _handlers =	missionNamespace getVariable [format ["para_l_eventHandlers_%1", _eventName], []];

{
	[_x select 1, _eventParams] call (_x select 0);
} forEach _handlers;
