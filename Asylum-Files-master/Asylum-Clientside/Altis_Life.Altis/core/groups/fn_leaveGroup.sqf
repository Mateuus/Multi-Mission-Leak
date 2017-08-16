/*
	File: fn_leaveGroup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for leaving the group.
*/
private["_index","_gang","_name","_group","_locked","_owner","_ownerID","_new_owner"];
_index = [life_my_group,life_group_list] call life_fnc_index;
if(_index == -1) exitWith {life_my_group = ObjNull;};

_gang = life_group_list select _index;
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
		
		life_group_list set[_index,[_name,_group,_locked,str(_new_owner),(getPlayerUID _new_owner)]];
		publicVariable "life_group_list";
		[[_new_owner,_group], "life_fnc_clientGroupLeader",_new_owner,false] spawn life_fnc_MP;
	}
		else
	{
		life_group_list set [_index,-1];
		life_group_list = life_group_list - [-1];
		publicVariable "life_group_list";
	};
};

life_my_group = ObjNull;
if(rank player != "PRIVATE") then
{
	player setRank "PRIVATE";
};
if (life_gang != "0") then
{
	{
		if ((_x getVariable ["gangName","omgRanD0M"]) == _name && !isNull(_x getVariable ["gangGroup",objNull]) && count (units (group _x)) < 10) exitWith { [player] joinSilent (group _x); };
	} foreach allPlayers;
}
else
{
	[player] joinSilent (createGroup civilian);
	hint "You have left your group.";
};


closeDialog 0;