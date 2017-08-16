/*
		fn_refueljerryrefuel.sqf
		Author: G00golplexian
		
		Description: Refuels the empty canister.
*/

private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_tanke"];

_tanke = nearestObjects[getPos player, ["Land_fs_feed_F"],5];

if(life_beatgeld < 1500) exitWith {hint "Du hast zu wenig Bargeld bei dir."};
if(count _tanke == 0) exitwith {hint "Keine Tankstelle in der Naehe!"};
if!(isNull objectParent player) exitWith {hint "Du kannst den Kanister nicht aus einem Fahrzeug heraus befuellen!"};

life_interrupted = false;
life_action_inUse = true;
closedialog 0;

_action = [
	"Möchtest du den Benzinkanister für 1.500€ wieder auffüllen?",
	"Kanister befüllen",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {};
if(!([false,"fuelE",1] call life_fnc_handleInv)) exitWith {};
life_beatgeld = life_beatgeld - 1500;

_sleep = 0.195;
_cP = 0.01;
_upp = "Befülle Kanister...";

_handle = [_upp,_sleep,_cP,"AinvPknlMstpsnonWnonDnon_medic_1",nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

life_action_inUse = false;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};

titleText["Du hast den Benzinkanister wieder aufgefüllt","PLAIN"];
[true,"fuelF",1] call life_fnc_handleInv;