#include "..\..\script_macros.hpp"
/*
	File: fn_blastingCharge.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint  "Dies kann nur an einem Tresor benutzt werden."};
if(_vault GVAR ["chargeplaced",false]) exitWith {hint  "Es gibt bereits eine Sprengladung am Tresor."};
if(_vault GVAR ["safe_open",false]) exitWith {hint  "Der Tresor ist bereits offen."};
if({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min"))) exitWith {
 	hint format [ "Es müssen %1 oder mehr Polizisten online sein, um fortfahren zu können.",(LIFE_SETTINGS(getNumber,"cops_online_min"))]
};
if((nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) GVAR ["locked",true]) exitWith {hint  "You must open the container before placing the charger!"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault SVAR ["chargeplaced",true,true];
[0,"Eine Sprengladung wurde am Safe angebracht. Du hast Zeit, bis die Uhr abläuft, um die Ladung zu entschärfen!"] remoteExecCall ["life_fnc_broadcast",west];
hint  "Der Timer läuft! Halte die Polizei von Safe fern!";
_handle = [] spawn life_fnc_demoChargeTimer;
[] remoteExec ["life_fnc_demoChargeTimer",west];

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint  "Die Sprengladung wurde entschärft!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank SVAR ["chargeplaced",false,true];
fed_bank SVAR ["safe_open",true,true];

hint  "Der Tresor ist jetzt offen";
