#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!(_vault getVariable["lastbombkaboom",true])) exitWith {hintSilent localize "STR_ISTR_Blast_Robb"};

if({side _x == west} count playableUnits < (ES_SETTINGS(getNumber,"cops_online_min"))) exitWith {
 	hint format [localize "STR_Civ_NotEnoughCops",(ES_SETTINGS(getNumber,"cops_online_min"))]
};
if(!([false,"blastingcharge",1] call ES_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable ["chargeplaced",true,true];
[0,"Achtung, Achtung !!! - Es wird versucht der Tresor zu knacken!"] remoteExec ["ES_fnc_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn ES_fnc_demoChargeTimer;
[] remoteExec ["ES_fnc_demoChargeTimer",west];
[player,"bank"] call ES_fnc_globalSound;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable ["chargeplaced",false,true];

[] spawn {
	fed_bank setVariable["lastbombkaboom",false,true];
	fed_bank setVariable["safe_open",true,true];
	uisleep (20 * 60);
	fed_bank setVariable["safe_open",false,true];
	uisleep (30 * 60);
	fed_bank setVariable["lastbombkaboom",true,true];
};

hint localize "STR_ISTR_Blast_Opened";