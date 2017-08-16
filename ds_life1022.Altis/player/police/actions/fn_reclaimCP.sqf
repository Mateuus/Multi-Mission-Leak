/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Captures police checkpoints
*/

private ["_counter","_cost","_copsNeeded","_civsNear"];

_counter = 300;
_infoArray = [];
_copsNeeded = 3;
_civsNear = false;

switch(true)do
	{
	case (player distance cp1 < 300) : {_infoArray = [1,cp1]};
	case (player distance cp2 < 300) : {_infoArray = [2,cp2]};
	case (player distance cp3 < 300) : {_infoArray = [3,cp3]};
	default {_infoArray = []};
	};

//if((_infoArray select 1) getVariable ["taking",false])exitwith{hint "This checkpoint is already being captured"};
if([player,100,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["A civilian is too nearby to reclaim this checkpoint","PLAIN"];};
if((!((_infoArray select 1) getVariable ["captured",false]))&&((_infoArray select 1) getVariable ["taking",false]))exitwith{hint "This checkpoint was either bugged or you stupidly tried reclaiming it while it was still being captured, either way it is fixed now";(_infoArray select 1) setVariable ["fixMe",true,true]};
if(!((_infoArray select 1) getVariable ["captured",false]))exitwith{hint "This checkpoint is already under police control"};
//(_infoArray select 1) setVariable ["taking",true,true];

hint "It takes up to 5 minutes of remaining in the area to reclaim a checkpoint, remain here defend the areas from rebels";
systemchat "It takes up to 5 minutes of remaining in the area to reclaim a checkpoint, remain here defend the areas from rebels";
sleep 10;
[0,format["The police are reclaiming Checkpoint %1!", (_infoArray select 0)],true,0] remoteExecCall ["DS_fnc_globalMessage",west];
sleep 10;

while{alive player}do
	{
	if(_counter == 0)exitwith
		{
		if(!((_infoArray select 1) getVariable ["captured",false]))exitwith{hint "This checkpoint is already under police control"};
		systemchat "You have taken control of this checkpoint, continue to guard this area to receive payments!";
		hint "You have taken control of this checkpoint, continue to guard this area to receive payments!";
		[0,format["The police have reclaimed checkpoint %1", (_infoArray select 0)],true,0] remoteExecCall ["DS_fnc_globalMessage",west];
		(_infoArray select 1) setVariable ["taking",false,true];
		(_infoArray select 1) setVariable ["captured",false,true];
		[18000,"Reclaimed a police checkpoint",name player] remoteExec ["DS_fnc_copRewards",west];
		[20000,true] remoteExec ["HUNT_fnc_policeBank",2];
		_types = ["Lamps_Base_F", "PowerLines_base_F","Land_PowerPoleWooden_L_F"];
		for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
		{
		_lamps = player nearObjects [_types select _i, 200];
		{_x setDamage 0} forEach _lamps;
		};
		};
	if(!((_infoArray select 1) getVariable ["captured",false]))exitwith{hint "This checkpoint is already under police control"};
	if(player distance (_infoArray select 1) > 130)exitwith{systemchat "You went too far from the checkpoint";hint 'You went too far from the checkpoint';(_infoArray select 1) setVariable ["taking",false,true];};
	_counter = _counter - 20;
		systemchat format ["You will own the checkpoint in %1 seconds",_counter+20];
		hint format ['You will own the checkpoint in %1 seconds',_counter+20];
	if((player getVariable ["policeSquad",""]) == "Rapid Response")then
		{
		sleep 10;
		}
		else
		{
		sleep 20;
		};
	};
//(_infoArray select 1) setVariable ["taking",false,true];