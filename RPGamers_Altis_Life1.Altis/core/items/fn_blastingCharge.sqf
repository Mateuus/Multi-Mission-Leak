#include "..\..\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private ["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if (isNull _vault) exitWith {}; //Bad object
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {[localize "STR_ISTR_Blast_VaultOnly",5,"gray"] call RPG_Fnc_Msg;};
if (_vault getVariable ["chargeplaced",false]) exitWith {[localize "STR_ISTR_Blast_AlreadyPlaced",5,"gray"] call RPG_Fnc_Msg;};
if (_vault getVariable ["safe_open",false]) exitWith {[localize "STR_GNOTF_Captured",5,"gray"] call RPG_Fnc_Msg;};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
	[format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))],5,"gray"] call RPG_Fnc_Msg;
};

private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

if ((nearestObject [_pos,_vaultHouse]) getVariable ["locked",true]) exitWith {[localize "STR_ISTR_Blast_Exploit",5,"gray"] call RPG_Fnc_Msg;};
if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];
[localize "STR_ISTR_Blast_KeepOff",5,"blue"] call RPG_Fnc_Msg;

[] remoteExec ["life_fnc_demoChargeTimer",[west,player]];
[] remoteExec ["TON_fnc_handleBlastingCharge",2];

playSound "planted";

["Charge"] spawn mav_ttm_fnc_addExp;

[[_vault], "life_fnc_bankalarmSound", true, false] spawn BIS_fnc_MP;
//[[_vault],"life_fnc_bankalarmsound",nil,true] spawn BIS_fnc_MP;