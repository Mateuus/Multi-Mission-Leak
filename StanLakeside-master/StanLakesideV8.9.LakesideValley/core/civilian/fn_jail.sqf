/*
	File: fn_jail.sqf
	
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = param [0,ObjNull,[ObjNull]];
[format["%1", _unit], false] spawn domsg;
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = param [1,false,[false]];
player setVariable["restrained", nil, true];
player setVariable["Escorting", nil, true];
player setVariable["transporting", nil, true];

[localize "STR_Jail_Warn", false] spawn domsg;
[localize "STR_Jail_LicenseNOTF", false] spawn domsg;
player setPos (getMarkerPos "jail_marker");

if (uniform player == "A3L_Prisoner_Outfit") then 
{
	A3L_Fnc_OldUniform = "A3L_Shirt";
} 
else
{
	A3L_Fnc_OldUniform = Uniform player;
};

if(_bad) then
{
	waitUntil {!deadPlayer};
	uiSleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cokeu",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cokep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_mdmau > 0) then {[false,"mdmau",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_mdmap > 0) then {[false,"mdmap",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[player,_bad] remoteExecCall ["life_fnc_jailSys",2];
[5] call SOCK_fnc_updatePartial;
call life_fnc_saveGear;