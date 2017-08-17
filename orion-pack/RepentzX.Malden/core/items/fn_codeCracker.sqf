#include "..\..\script_macros.hpp"
/*
    File: fn_codeCracker.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Code Cracker for the bank vault and nothing  more.. Yet.
*/
private ["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if (isNull _vault) exitWith {}; //Bad object
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (_vault getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if (_vault getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops_bank"))) exitWith {
     hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops_bank"))];
};

/*
private _vaultHouse = MALDEN_TANOA("Land_Cargo_House_V4_F","Land_Medevac_house_V1_F");
_maldenArray = [16019.5,16952.9,0];
_tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = MALDEN_TANOA(_maldenArray,_tanoaArray);
*/

if (!([false,"codeCracker",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable ["chargeplaced",true,true];
remoteExec ['life_fnc_AAN_Bank',-2];
[localize "STR_ISTR_Blast_KeepOff",true,"slow"] call life_fnc_notificationSystem;

[] remoteExec ["life_fnc_demoChargeTimerBank",[west,player]];
[] remoteExec ["TON_fnc_handleBlastingChargeBank",2];