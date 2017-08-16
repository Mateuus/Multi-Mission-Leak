/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = param [0,ObjNull,[ObjNull]];
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(lhm_is_arrested == 1) exitWith {}; //Dafuq i'm already arrested
_bad = param [1,false,[false]];
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call lhm_fnc_removeLicenses;
if(lhm_inv_heroinu > 0) then {[false,"heroinu",lhm_inv_heroinu] call lhm_fnc_handleInv;};
if(lhm_inv_heroinp > 0) then {[false,"heroinp",lhm_inv_heroinp] call lhm_fnc_handleInv;};
if(lhm_inv_coke > 0) then {[false,"cocaine",lhm_inv_coke] call lhm_fnc_handleInv;};
if(lhm_inv_cokep > 0) then {[false,"cocainep",lhm_inv_cokep] call lhm_fnc_handleInv;};
if(lhm_inv_turtle > 0) then {[false,"turtle",lhm_inv_turtle] call lhm_fnc_handleInv;};
if(lhm_inv_cannabis > 0) then {[false,"cannabis",lhm_inv_cannabis] call lhm_fnc_handleInv;};
if(lhm_inv_marijuana > 0) then {[false,"marijuana",lhm_inv_marijuana] call lhm_fnc_handleInv;};
if(lhm_inv_goldbar > 0) then {[false,"goldbar",lhm_inv_goldbar] call lhm_fnc_handleInv;};
if(lhm_inv_moonshine > 0) then {[false,"moonshine",lhm_inv_moonshine] call lhm_fnc_handleInv;};
if(lhm_inv_bottledshine > 0) then {[false,"bottledshine",lhm_inv_bottledshine] call lhm_fnc_handleInv;};
if(lhm_inv_mash > 0) then {[false,"mash",lhm_inv_mash] call lhm_fnc_handleInv;};
if(blastingcharge > 0) then {[false,"blastingcharge",blastingcharge] call lhm_fnc_handleInv;};
if(lhm_inv_boltcutter > 0) then {[false,"boltcutter",lhm_inv_boltcutter] call lhm_fnc_handleInv;};
if(lhm_inv_uran > 0) then {[false,"uran",lhm_inv_uran] call lhm_fnc_handleInv;};
if(lhm_inv_uranwaste > 0) then {[false,"uranwaste",lhm_inv_uranwaste] call lhm_fnc_handleInv;};
if(lhm_inv_unpMeth > 0) then {[false,"unpMeth",lhm_inv_unpMeth] call lhm_fnc_handleInv;};
if(lhm_inv_procMeth > 0) then {[false,"procMeth",lhm_inv_procMeth] call lhm_fnc_handleInv;};

lhm_is_arrested = 1;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

// LHM Start
removeUniform player;
removeVest player;
_tempUniform = uniform player;
player forceAddUniform "U_C_Scientist";
waitUntil {uniform player == "U_C_Scientist"};
//player setObjectTextureGlobal [0,'core\textures\uniforms\prisoner_clothing.jpg']; // Jail Clothing Yellow
lhm_curWep_h = nil; // Remove holstered guns
// LHM End

[[player,_bad],"lhm_fnc_jailSys",false,false] call lhm_fnc_mp;
[5] call SOCK_fnc_updatePartial;