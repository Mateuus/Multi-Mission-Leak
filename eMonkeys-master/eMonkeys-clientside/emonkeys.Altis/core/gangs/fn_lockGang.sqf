/*
	File: fn_lockGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the gang
*/
private["_gang","_index","_name","_group","_owner","_ownerID"];
_index = [eM_my_gang,EMonkeys_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {};
_gang = EMonkeys_gang_list select _index;
_name = _gang select 0;
_group = _gang select 1;
_owner = _gang select 3;
_ownerID = _gang select 4;

switch (true) do
{
	case (player == leader(group player)) :
	{
		EMonkeys_gang_list set[_index,[_name,_group,true,_owner,_ownerID]];
		publicVariable "EMonkeys_gang_list";

		ctrlShow[2622,false];
		ctrlShow[2623,true];
	};
	
	case (getPlayerUID player == _ownerID) :
	{
		EMonkeys_gang_list set [_index,[_name,_group,true,_owner,_ownerID]];
		publicVariable "EMonkeys_gang_list";

		ctrlShow[2622,false];
		ctrlShow[2623,true];
	};
};

[false] spawn EMonkeys_fnc_gangManagement;