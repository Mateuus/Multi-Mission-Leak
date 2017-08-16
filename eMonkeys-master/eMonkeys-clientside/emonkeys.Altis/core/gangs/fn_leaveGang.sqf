/*
	File: fn_leaveGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for leaving the gang.
*/
private["_index","_gang","_name","_group","_locked","_owner","_ownerID","_new_owner"];
_index = [eM_my_gang,EMonkeys_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {eM_my_gang = ObjNull;};

_gang = EMonkeys_gang_list select _index;
_name = _gang select 0;
_group = _gang select 1;
_locked = _gang select 2;
_owner = _gang select 3;
_ownerID = _gang select 4;

if(getPlayerUID player == _ownerID) then
{
	if(count (units(group player)) > 1) then
	{
		{
			if(_x != player) exitWith
			{
				_new_owner = _x;
			};
		} foreach (units (group player));
		
		EMonkeys_gang_list set[_index,[_name,_group,_locked,str(_new_owner),(getPlayerUID _new_owner)]];
		publicVariable "EMonkeys_gang_list";
		[[_new_owner,_group], "clientGangLeader",_new_owner,false] call EMonkeys_fnc_mp;
	}
		else
	{
		EMonkeys_gang_list set [_index,-1];
		EMonkeys_gang_list = EMonkeys_gang_list - [-1];
		publicVariable "EMonkeys_gang_list";
	};
};

eM_my_gang = ObjNull;
if(rank player != "PRIVATE") then
{
	player setRank "PRIVATE";
};

switch (playerSide) do
{
	case civilian: {[player] joinSilent (createGroup civilian)};
	case east: {[player] joinSilent (createGroup east);}
};

[player] joinSilent (createGroup civilian);
hint "Du hast deine Gang verlassen!";


closeDialog 0;