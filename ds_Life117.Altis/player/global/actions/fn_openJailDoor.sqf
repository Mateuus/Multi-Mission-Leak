/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Uses C4
*/

private ["_infoArray","_pos","_copsNeeded"];

if(!(jailController getVariable ["closed",false]))exitwith{hint "This door is already open"};
if(repairJail getVariable ["closed",false])exitwith{hint "You can not open this while the main gate is closed"};
_pos = (position player);

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
	_upp = "Opening jail door";
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
		if(player distance _pos > 10)exitwith {};
		if(DS_tazed)exitwith{};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
	DS_doingStuff = false;
	if(DS_tazed)exitwith{};
	if(player != vehicle player) exitWith {};	
	if(player distance _pos > 10)exitwith {hint "You moved too far away";};
hint "Door is opening..... ";
deleteVehicle jailGate2;
jailController setVariable ["closed",false,true];
[[3],"HUNT_fnc_jail",false,false] spawn BIS_fnc_MP;	