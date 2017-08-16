/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Captures police checkpoints
*/
private ["_counter","_cost","_copsNeeded"];

_counter = 300;
_infoArray = [];
_copsNeeded = 3;

switch(true)do
	{
	case (player distance cp1 < 300) : {_infoArray = [1,cp1]};
	case (player distance cp2 < 300) : {_infoArray = [2,cp2]};
	case (player distance cp3 < 300) : {_infoArray = [3,cp3]};
	default {_infoArray = []};
	};

//if((_infoArray select 1) getVariable ["taking",false])exitwith{hint "This checkpoint is already being captured"};
if(!((_infoArray select 1) getVariable ["captured",false]))exitwith{hint "This checkpoint is already under police control"};
//(_infoArray select 1) setVariable ["taking",true,true];

hint 'It takes up to 5 minutes of remaining in the area to reclaim a checkpoint, remain here defend the areas from Rebels';
systemchat 'It takes up to 5 minutes of remaining in the area to reclaim a checkpoint, remain here defend the areas from Rebels';
sleep 10;
[[0,format["The police are reclaiming Check Point %1!", (_infoArray select 0)],true],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
[[1,format["The police are reclaiming Check Point %1!", (_infoArray select 0)],true],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
sleep 10;

while{alive player}do
	{
	if(_counter == 0)exitwith	
		{
		if(!((_infoArray select 1) getVariable ["captured",false]))exitwith{hint "This checkpoint is already under police control"};
		systemchat "You have taken control of this check point, continue to guard this area to receive payments!";
		hint 'You have taken control of this check point, continue to guard this area to receive payments!';
		[[0,format["The police have reclaimed checkpoint %1", (_infoArray select 0)],true],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		[[1,format["The police have reclaimed checkpoint %1", (_infoArray select 0)],true],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		(_infoArray select 1) setVariable ["taking",false,true];
		(_infoArray select 1) setVariable ["captured",false,true];
		[[18000,name player,"Reclaimed a police checkpoint"],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
		[[20000,true],"HUNT_fnc_policeBank",false,false] spawn BIS_fnc_MP;
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






































