/*
	File: groupMarkers.sqf
	Author: Bryan "Tonic" Boardwine, modified by Vacation Gaming

	Description:
	Marks groupMembers on the map for other groupMembers. Only initializes when the actual map is open.
*/
private["_markers","_groupMembers"];
_markers = [];
_groupMembers = [];

sleep 0.5;
if(visibleMap && ("ItemRadio" in assignedItems player)) then {
	{if(((side _x == side player) && (group _x == group player) && ("ItemRadio" in assignedItems player) && ("ItemRadio" in assignedItems _x)) || ((_x == player))) then {_groupMembers pushBack _x;}} foreach playableUnits; //Fetch list of groupMembers

	_members = units (group player);
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];

		_markers pushBack [_marker,_x];
	} foreach _groupMembers;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if((!isNull _unit) && ((("ItemRadio" in assignedItems player) && ("ItemRadio" in assignedItems _unit)) || ((_unit == player)))) then
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
	_groupMembers = [];
};