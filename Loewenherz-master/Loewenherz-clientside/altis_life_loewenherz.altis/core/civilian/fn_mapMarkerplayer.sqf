/*
	File: fn_mapMarkerPlayer.sqf
	Author: Barney

	Description:
	Marks gang members for each others. Only initializes when the actual map is open.
*/

private ["_markers","_markersBank","_member","_bankMembers","_bank","_marker","_unit"];
_markers = [];
_markersBank = [];
_member = [];
_bankMembers = [];
_bank = false;

sleep 0.5;
if(visibleMap) then {
	waitUntil {visibleMap && isNil "mapm"};  // LHM   added var for ESP so names are not displayed twice
	if(!isnil "BankHeist_Team") then {
		if(player in BankHeist_Team) then {
			_bank = true;

		}

	};

	{
		if((group _x) == group player  && !(_x getVariable "restrained")) then
			{
				_member pushBack _x;
			};
			if(!isnil "BankHeist_Team") then {
				if(_bank && _x in BankHeist_Team) then {
					_member = _member - [_x];
					_bankMembers pushBack _x;
				};

			};

	} foreach playableUnits; //Fetch list of cops / blufor

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];

		_markers pushBack [_marker,_x];
	} foreach _member;

	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["Bankteam: %1", _x getVariable["realname",name _x]];

		_markersBank pushBack [_marker,_x];


	} foreach _bankMembers;

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
		} foreach _markersBank;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	{deleteMarkerLocal (_x select 0);} foreach _markersBank;
	_markers = [];
	_markersBank = [];
	_member = [];
	_bankMembers = [];
};