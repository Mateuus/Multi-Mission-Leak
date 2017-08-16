#include <macro.h>

/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(life_action_inUse) exitWith {hintSilent localize "STR_NOTF_Action"};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search isEqualTo 0) exitWith {hintSilent localize "STR_Service_Chopper_NoAir"};
if(an_cash < 1000) exitWith {hintSilent localize "STR_Serive_Chopper_NotEnough"};
[1000,0,1] call life_fnc_sewawruk;
life_action_inUse = true;
_title = localize "STR_Service_Chopper_Servicing";
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format ["%1...", _title];
_progressTime = (60 / (1 / 0.006));

for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _progressTime;
	if(!alive player) exitWith {};
};

if(!alive (_search select 0) OR {(_search select 0) distance air_sp > 10}) exitWith {life_action_inUse = false; hintSilent localize "STR_Service_Chopper_Missing"};
if(!local (_search select 0)) then
{
	[(_search select 0),1] remoteExecCall ["setFuel",(_search select 0)];
}
	else
{
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;
[false] call life_fnc_tufruxatra;
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
life_action_inUse = false;
