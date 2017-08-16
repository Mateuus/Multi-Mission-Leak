/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if((west countside playableUnits) < 4) exitWith {hint "Es müssen mindestens 4 Polizisten aktiv sein."};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

[2,">> In die Zentralbank wird eingebrochen! <<"] remoteExecCall ["life_fnc_broadcast",west];
_vault setVariable["chargeplaced",true,true];
[fed_bank, "beep"] remoteExecCall ["say3D",0];
[0,"STR_ISTR_Blast_Placed"] remoteExecCall ["life_fnc_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
remoteExec ["life_fnc_demoChargeTimer",west];

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];
if(license_civ_rebel) then {life_exp = life_exp + round(random(1000));} else {life_exp = life_exp - round(random(1000));};
[] call life_fnc_exptoplevel;

hint localize "STR_ISTR_Blast_Opened";