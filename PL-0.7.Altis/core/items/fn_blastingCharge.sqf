#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle","_log","_unit","_alarmSound"];
_vault = param [0,ObjNull,[ObjNull]];
_unit = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_alarmSound = "alarm_bank";

if(life_actionLimite == 1) exitWith {hint localize "STR_Action_Banque_Nonok";}; //Avant tout, est-ce que la Douane est en cours ?

if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault GVAR ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(life_banque == 1) exitWith {hint "La banque à déja été braquée !"};
if({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min"))) exitWith {hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault SVAR ["chargeplaced",true,true];
[[_unit, _alarmSound, 300], "life_fnc_alarm_bank", true, false] call life_fnc_MP;
[0,"STR_ISTR_Blast_Placed"] remoteExecCall ["life_fnc_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
[] remoteExec ["life_fnc_demoChargeTimer",west];

life_actionLimite = 1; //On bloque la banque et la douane.

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPos fed_bank select 0, getPos fed_bank select 1, (getPos fed_bank select 2)+13];
fed_bank SVAR ["chargeplaced",false,true];
fed_bank SVAR ["safe_open",true,true];
hint localize "STR_ISTR_Blast_Opened";
life_banque = life_banque + 1;

sleep (15 * 60);
life_actionLimite = 0; //Et on débloque après le timer et 15 minutes soit 25 minutes.