/*
	fn_sendToJail.sqf
*/

params [["_unit", ObjNull, [ObjNull]], ["_bad", false, [false]]];

[format["%1", _unit], false] spawn domsg;
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {};
if(life_is_arrested) exitWith {};
life_arrestMinutes = _this select 2;
life_arrestReason = _this select 3;

["Reset",0] call fnc_battery;

["Remove",500] call fnc_karma;

A3L_Fnc_OldUniform = Uniform player;
player addUniform "A3L_Prisoner_Outfit";

[localize "STR_Jail_LicenseNOTF", false] spawn domsg;

if(_bad) then
{
	waitUntil {sleep 1; !deadPlayer};
	uiSleep 1;
};
if(life_inv_methu > 0) then {[false,"methu",life_inv_methu] call life_fnc_handleInv;};
if(life_inv_methp > 0) then {[false,"methp",life_inv_methp] call life_fnc_handleInv;};
if(life_inv_cokeu > 0) then {[false,"cokeu",life_inv_cokeu] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cokep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
[player,_bad,life_arrestMinutes,life_arrestReason] remoteExecCall ["life_fnc_svr_sendToJail",2];
life_is_arrested = true; //This never got set?
[5] call SOCK_fnc_updatePartial;
[7] call SOCK_fnc_updatePartial;