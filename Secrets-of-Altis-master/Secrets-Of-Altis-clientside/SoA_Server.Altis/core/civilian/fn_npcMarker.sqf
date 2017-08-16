/*
	File: fn_helitaxi.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: G00golplexian
	
	Description:
	Marks Helis on the map for other Civs. Only initializes when the actual map is open.
*/
private["_markers","_npc"];
_markers = [];
_npc = [];

sleep 0.5;
if(visibleMap) then {

	_npc = [Helitaxi1, Helitaxi2, Helitaxi3, Helitaxi4, dealer_1, dealer_2, dealer_3];

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "Mil_triangle";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers set[count _markers,[_marker,_x]];
		//_markers pushBack [_marker,_x];
	} foreach _npc;
	
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_npc = [];
};