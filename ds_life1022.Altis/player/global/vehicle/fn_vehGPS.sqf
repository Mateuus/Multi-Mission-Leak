/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	If your vehicle has security installed this will show a gps marker of the vehicle on the map
*/

private["_myVehs","_marker","_unit"];
_cars = [];
_myVehs = [];
_counter = 0;
sleep 0.5;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;
if(visibleMap) then {
	{if((_x in DS_keyRing)&&(_x getVariable "security")) then {_cars pushBack _x;}} foreach vehicles;
	{if((_x in DS_keyRing)&&(_x getVariable "securityAdv")) then {_cars pushBack _x;}} foreach vehicles;
	if(_cars isEqualTo [])exitwith{};
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "b_motor_inf";
		_marker setMarkerTextLocal "My Vehicle";
		
		_myVehs pushBack [_marker,_x];
	} foreach _cars;

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
		} foreach _myVehs;
		if(!visibleMap) exitWith {};
		sleep 1;
		_counter = _counter + 1;
		if(_counter > 20)exitwith{};
	};

	{deleteMarkerLocal (_x select 0);} foreach _myVehs;
	_myVehs = [];
};
