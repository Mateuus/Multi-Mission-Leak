/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by PlayGermany
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_deadMarkers","_units","_members"];
_deadMarkers = [];
_markers = [];
_members = [];
_units = [];

if((life_hsd == "event") && {!("ItemGPS" in assignedItems player)}) exitWith {hint "Du siehst die Position deiner Kollegen leider nicht, da du kein GPS besitzt";};

sleep 0.25;
if(visibleMap) then {
	/*###################################
				Dead Markers
	###################################*/
	if (life_hsd in ["med","alac","thw"]) then {
		{
			_name = _x getVariable "name";
			_down = _x getVariable ["Revive",false];
			_time = _x getVariable ["DeathTime",0];
			_requested = _x getVariable ["Requested",false];
			if(!isNil "_name" && !_down) then {
				_units pushBack [_x,_time,_requested];
			};
		} foreach allDeadMen;
		
		//Loop through and create markers.
		{
			_marker = createMarkerLocal [format["%1_dead_marker",_x select 0],visiblePosition (_x select 0)];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			if(_x select 2) then {
				_marker setMarkerTextLocal format["%1:%2min:Angefragt",((_x select 0) getVariable["name","Unknown Player"]),(time - (_x select 1)) / 60];
			} else {
				_marker setMarkerTextLocal format["%1:%2min",((_x select 0) getVariable["name","Unknown Player"]),(time - (_x select 1)) / 60];
			};
			_deadMarkers pushBack _marker;
		} foreach _units;
		
		//Radio Cells
		{
			_cell = (_x select 1);
			if(!(_cell getVariable ["gangOwner",grpNull] isEqualTo grpNull)) then {
				_marker = createMarkerLocal [format["cellMarker_%1",_forEachIndex],visiblePosition _cell];
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerTypeLocal "mil_warning";
				_marker setMarkerTextLocal "Gehackte Funkzelle";
				_deadMarkers pushBack _marker;
			};
		} foreach PGSERV_mobile_radiocells;
	};
	
	/*###################################
				Group Markers
	###################################*/
	
	if (life_hsd == "event") then {
		{if("ItemGPS" in assignedItems _x) then {_members pushBack _x;}} foreach units group Player;
	} else {
		{if((side _x == independent) && {_x getVariable ["hsd","med"] in ["med","alac","thw"]}) then {_members pushBack _x;};} foreach playableUnits; //Fetch list of the Medics,ALACs and THWs
	};
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1 %2", format["[%1]",toUpper (_x getVariable ["hsd","hsd"])], name _x];
	
		_markers pushBack [_marker,_x];
	} foreach _members;
		
	while {visibleMap} do {
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	/*###################################
				Cleanup
	###################################*/
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
	if (life_hsd in ["med","alac","thw"]) then {{deleteMarkerLocal _x;} foreach _deadMarkers;};
};