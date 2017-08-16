/*
	File: fn_groupManagement.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for the group 'management' menu.
*/
private["_sleep","_group","_group","_owner","_ownerID","_units","_dialog","_members"];
disableSerialization;

_sleep = [_this,0,false,[false]] call BIS_fnc_param;
if(_sleep) then { sleep 1;};

_group = life_my_group;
if(isNull _group) exitWith {closeDialog 0;};
_gang = [_group,life_group_list] call life_fnc_index;
_gang = life_group_list select _gang;
_owner = call compile format["%1",_gang select 3];
_ownerID = _gang select 4;
_units = units (group player);
waitUntil {!isNull (findDisplay 2620)};
_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;

lbClear _members;

switch (true) do
{
	case (player == leader(group player)) :
	{
		ctrlShow[2623,true];
	};
	
	case ((getPlayerUID player) == _ownerID) :
	{
		ctrlShow[2623,true];
	};
	
	default
	{
		ctrlShow[2623,false];
		ctrlShow[2624,false];
		ctrlShow[2625,false];
	};
};

ctrlSetText[601,(_gang select 0)];

for "_i" from 0 to (count _units)-1 do
{
	switch (true) do
	{
		case ((_units select _i) == leader(group player)) :
		{
			_members lbAdd format["%1 [Leader]",name (_units select _i)];
		};
		
		case ((getPlayerUID (_units select _i)) == _ownerID) :
		{
			_members lbAdd format["%1 [Founder]", name (_units select _i)];
		};
		
		default 
		{
			_members lbAdd format["%1",name (_units select _i)];
		};
	};
	
	_members lbSetData [(lbSize _members)-1,str(_units select _i)];
};