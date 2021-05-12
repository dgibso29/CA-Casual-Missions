/*
	File: fn_player_markers_job.sqf
	Author: Spoffy
	Date: 2020-05-29
	Last Update: 2020-07-03
	Public: No
	
	Description:
	    Called periodically to maintain player markers. 
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
	    call vn_mf_fnc_player_marker_job
*/

//Markers which has corresponding players in the game.
private _activePlayerMarkers = [];
private _activeVehicleMarkers = [];

//Vehicles which have players in.
vn_mf_player_markers_manned_vehicles = [];

{
	private _unit = _x;
	private _unitMarker = format ["player_marker_%1", getPlayerUID _unit];

	//Easiest way to check if it exists
	if (markerShape _unitMarker == "") then {
		createMarkerLocal [_unitMarker, [0,0,0]];
		_unitMarker setMarkerTextLocal name _unit;
		_unitMarker setMarkerShapeLocal "ICON";
		_unitMarker setMarkerTypeLocal "b_inf";
		_unitMarker setMarkerAlphaLocal 1;
	};

	_activePlayerMarkers pushBack _unitMarker;

	private _healthState = lifeState _unit;
	private _incapacitated = alive _unit && (_unit getVariable ["vn_revive_incapacitated", false] || _healthState == "INCAPACITATED");

	if (alive _unit) then {
		if (_incapacitated) then {
			_unitMarker setMarkerColorLocal "ColorRed";
		} else {
			_unitMarker setMarkerColorLocal "ColorBLUFOR";
		};
	} else {
		_unitMarker setMarkerColorLocal "ColorGrey";
	};

	//Special case if player is in vehicle.
	if (vehicle _unit != _unit) then {
		vn_mf_player_markers_manned_vehicles pushBackUnique vehicle _unit;
		_unitMarker setMarkerAlphaLocal 0;
	} else {
		_unitMarker setMarkerAlphaLocal 1;
	};
} forEach allPlayers;

//Add markers for vehicles.
{
	private _vehicle = _x;
	private _crew = crew _vehicle select {isPlayer _x};
	//If somehow we've got a vehicle in this list with no player crew.
	if (_crew isEqualTo []) exitWith {};

	private _vehicleMarker = format ["player_marker_vehicle_%1", netId _vehicle];
	_activeVehicleMarkers pushBack _vehicleMarker;

	//Easiest way to check if it exists
	if (markerShape _vehicleMarker == "") then {
		createMarkerLocal [_vehicleMarker, [0,0,0]];
		_vehicleMarker setMarkerColorLocal "ColorBLUFOR";
		_vehicleMarker setMarkerShapeLocal "ICON";
		_vehicleMarker setMarkerAlphaLocal 1;

		private _markerType = call {
			if (_vehicle isKindOf "Helicopter") exitWith {"b_air"};
			if (_vehicle isKindOf "Plane") exitWith {"b_plane"};
			"b_motor_inf"
		};

		_vehicleMarker setMarkerTypeLocal _markerType;
	};

	private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
	_vehicleMarker setMarkerTextLocal format [localize "STR_vn_mf_player_markers_vehicle_marker", _vehicleName, count _crew];
} forEach vn_mf_player_markers_manned_vehicles;

//Prune markers for players that have left.
private _inactiveMarkers = (vn_mf_player_markers - _activePlayerMarkers) + (vn_mf_player_markers_vehicle_markers - _activeVehicleMarkers);

{
	deleteMarker _x;
} forEach _inactiveMarkers;

vn_mf_player_markers = _activePlayerMarkers;
vn_mf_player_markers_vehicle_markers = _activeVehicleMarkers;