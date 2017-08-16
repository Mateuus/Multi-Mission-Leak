/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {hint localize "STR_Service_Chopper_NoAir"};

_action = [
	format["Willst du deinen Helikopter für 5000€ reparieren und auftanken lassen?",
	"Helikopter mit Kerosin betanken",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(!_action) exitwith {};

if(life_beatgeld < 5000) exitWith {hint localize "STR_Serive_Chopper_NotEnough"};
life_beatgeld = life_beatgeld - 5000;
life_action_inUse = true;

_sleep = 0.2;
_cP = 0.01;
_upp = localize "STR_Service_Chopper_Servicing";

_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false;};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {life_action_inUse = false; hint localize "STR_Service_Chopper_Missing"};
if(!local (_search select 0)) then
{
		[(_search select 0),1] remoteExecCall ["life_fnc_setFuel",(_search select 0)];
}
	else
{
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

titleText [localize "STR_Service_Chopper_Done","PLAIN"];
life_action_inUse = false;