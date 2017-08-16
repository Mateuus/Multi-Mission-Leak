/*
	File: fn_createGroup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality meant for creating groups.
*/
private["_value","_len","_group"];
_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "The maximum character limit for a group name is 25."};
if(([_value,life_group_list] call life_fnc_index) != -1) exitWith {hint "That group name is already taken!"};

_group = createGroup civilian;

//Set Array
life_group_list pushBack [_value,_group,"",str(player),getPlayerUID player];
publicVariable "life_group_list";
[player] joinSilent _group;
player setRank "CORPORAL";
life_my_group = _group;
if(!isNull life_my_group) then
{
	closeDialog 0;
	createDialog "life_my_group_Diag";
	publicVariable "life_group_list";
};