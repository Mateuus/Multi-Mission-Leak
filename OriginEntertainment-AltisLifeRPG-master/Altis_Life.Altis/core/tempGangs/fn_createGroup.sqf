/*	
		File: fn_createGang.sqf	
*/
private["_value","_len","_group"];

_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "The maximum character limit for a group name is 25."};
if(isNil {life_group_list}) exitWith {hint "Server not authorized for feature."};
if(([_value,life_group_list] call TON_fnc_index) != -1) exitWith {hint "That group name is already taken!"};

_group = createGroup civilian;

/*Set Array*/
life_group_list set[count life_group_list,[_value,_group,false,str(player),getPlayerUID player]];
publicVariable "life_gang_list";
[player] joinSilent _group;
player setRank "COLONEL";
life_my_group = _group;
if(!isNull life_my_group) then
{	
	closeDialog 0;	
	createDialog "OE_Life_My_Group_Diag";	
	publicVariable "life_group_list";
};