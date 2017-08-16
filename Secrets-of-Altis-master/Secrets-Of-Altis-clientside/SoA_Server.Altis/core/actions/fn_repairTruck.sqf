#include <macro.h>
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_random"];
_veh = cursorTarget;
_random = round(random 2);
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		[player,"reparatur"] remoteExecCall ["say3D",0];
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		
		_upp = format["%1 wird repariert...",_displayName];
		_sleep = 0.195;
		_cP = 0.01;

		_handle = [_upp,_sleep,_cP,"Acts_carFixingWheel",_veh,12] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;life_schatzsuche = false;life_action_inUse = false;};
		if(life_process_bad) exitWith {life_process_bad = false;life_schatzsuche = false;life_action_inUse = false;};
		
		life_action_inUse = false;
		player switchmove "";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if!(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		if (playerside != independent && independent countside playableUnits > 0) then {
			player removeItem "ToolKit";
			_veh setdamage 0.4;
			hint format["Aufgrund deiner Unkenntnis in der Reparatur von Fahrzeugen, wurde dein %1 beschädigt.",typeOf _veh];
		} else {
			if(playerside != independent) then {player removeItem "ToolKit"};
			_veh setdamage 0;
			hint "Das Fahrzeug wurde vollständig repariert.";
		};
	};
};