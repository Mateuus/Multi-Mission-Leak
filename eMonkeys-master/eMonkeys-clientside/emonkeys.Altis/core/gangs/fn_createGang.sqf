/*
	File: fn_createGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality meant for creating gangs.
*/
private["_value","_len","_group"];
_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "Maximal 25 Zeichen!"};
if(EMonkeys_c164 < 2000) exitWith {hint "Hast du genug Geld für eine Gang dabei?"};
if(isNil {EMonkeys_gang_list}) exitWith {hint "Server not authorized for feature."};
if(([_value,EMonkeys_gang_list] call TON_fnc_index) != -1) exitWith {hint "Dieser Name ist bereits vergeben."};

_group = createGroup east;

//Set Array
EMonkeys_gang_list pushBack [_value,_group,false,str(player),getPlayerUID player];
publicVariable "EMonkeys_gang_list";
[player] joinSilent _group;
player setRank "COLONEL";
eM_my_gang = _group;
if(!isNull eM_my_gang) then
{
	EMonkeys_c164 = EMonkeys_c164 - 2000;
	closeDialog 0;
	createDialog "EMonkeys_My_Gang_Diag";
	publicVariable "EMonkeys_gang_list";
};