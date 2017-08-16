/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			For police to clean up a dead body and stop it respawning
*/
private ["_victim","_vehicle"];
_victim = DS_cursorTarget;
if(isNull _victim)exitwith{};
if(!(_victim getVariable ["revive",false]))exitwith{hint "You can not use this on this player"};
_vehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],15] select 0;
if(isNil "_vehicle") exitWith {hint "You must have a police vehicle nearby to put the body into"};   
if(!(_vehicle getVariable ["policeVehicle",false])) exitWith {hint "You must have a police vehicle nearby to put the body into"};   

	_upp = format ["Removing %1s body",_victim getVariable ["name","Random guy"]];
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
		{
		sleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _victim > 10)exitwith {};
		if(_vehicle distance _victim > 10)exitwith {};
		};
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	if(player != vehicle player) exitWith {};
	if(player distance _victim > 10)exitwith {};
	if(_vehicle distance _victim > 10)exitwith {};
	titleText [format["Success, You have moved %1s body into your vehicle",_victim getVariable ["name","This random guy"]],"PLAIN"];
	hint format ["Success, You have moved %1s body into your vehicle",_victim getVariable ["name","This random guy"]];
	_victim setVariable ["revive",false,true];
	hideBody _victim;
	[[_victim],"DS_fnc_clientCleanup"] spawn BIS_fnc_MP;

if((DS_infoArray select 21) == 14)then{[3] call DS_fnc_questCompleted};




