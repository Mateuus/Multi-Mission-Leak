#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
closeDialog 0;
_vault = param [0,ObjNull,[ObjNull]];
if(isNull _vault) exitWith {};
if(DWEV_lock_bundesbank) exitWith {hint "Wir sind pleite, es war schon jemand anderes hier. Versuch es sp�ter erneut.";};
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Kann nur an einem Safe verwendet werden."};
if(_vault getVariable["chargeplaced",false]) exitWith {hint "Es ist schon eine Bombenladung an diesem Safe."};
if ({(_x getVariable["coplevel",0]) > 1} count playableUnits < 8 ) exitWith {hint "Es muessen min. 8 Wachmeister oder h�her online sein."};
if ({(_x getVariable["coplevel",0]) > 5} count playableUnits < 3 ) exitWith {hint "Es muessen min. 3 Kommissar oder h�her online sein."};
if(_vault getVariable["safe_open",false]) exitWith {hint "Der Safe ist bereits ge�ffnet!"};
if(!([false,"blastingcharge",1] call DWEV_fnc_handlelnv)) exitWith {};

_robberCount = 0;

_objects = nearestObjects [_vault, ["Air","Car","Ship","Man"], 50];
	{
		if ( (side _x)  == west ) exitWith {};
		if (getPlayerUID _x != "" ) then 
			{
				_robberCount = _robberCount + 1;
			};	
	} foreach _objects;

if(_robberCount < 4) exitWith
{
	hint "Ihr seid nicht genug Leute um die Bundesbank auszurauben!!\n\nIhr muesst mindestens zu viert sein";
	[true,"blastingcharge",1] call DWEV_fnc_handlelnv;
};

[0] remoteExec ["DWF_fnc_lockBanks",2];
_vault setVariable["chargeplaced",true,true];
"Es wurde eine Sprengladung am Safe der Bundesbank platziert. Du hast nicht mehr viel Zeit zum entsch�rfen.!" remoteExec ["hint",west];
hint "Der Timer laeuft! -TICK-TACK- -TICK-TACK- Halte die Polizei vom Safe fern!";
[getPlayerUID player,getMyName,"461"] remoteExec ["DWEV_fnc_wantedAdd",2];
_handle = [] spawn DWEV_fnc_demoChargeTimer;

[] remoteExec ["DWEV_fnc_demoChargeTimer",west];

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint "Die Bombe wurde entschaerft!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint "Der Safe ist nun ge�ffnet";