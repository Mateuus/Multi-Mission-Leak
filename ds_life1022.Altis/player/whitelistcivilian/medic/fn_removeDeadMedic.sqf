/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For medics to clean up a dead body and stop it respawning
*/

private ["_victim","_vehicle"];
_victim = DS_cursorTarget;
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
if(isNull _victim)exitwith{};
_vehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_vehicle") exitWith {hint "You must have a vehicle nearby to put the body into"};

	_upp = format ["Removing %1s body",_victim getVariable ["name","Random guy"]];
	disableSerialization;
	"progressBar" cutRsc ["DS_progress","PLAIN"];
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
		if(!isNull objectParent player) exitWith {};
		if(player distance _victim > 10)exitwith {};
		if(_vehicle distance _victim > 10)exitwith {};
		};
		"progressBar" cutText ["","PLAIN"];
		player playActionNow "stop";
	if(!isNull objectParent player) exitWith {};
	if(player distance _victim > 10)exitwith {};
	if(_vehicle distance _victim > 10)exitwith {};
	titleText [format["Success, You have moved %1s body into your vehicle and been paid $10k for your services",_victim getVariable ["name","This random guy"]],"PLAIN"];
	deleteVehicle _victim;
	[10000,true,true] call DS_fnc_handleMoney;






