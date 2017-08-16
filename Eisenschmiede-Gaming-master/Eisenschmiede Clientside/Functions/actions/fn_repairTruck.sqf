#include "..\script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test"];
_veh = cursorTarget;
ES_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {
	if("ToolKit" in (items player)) then {
		ES_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["ES_progress","PLAIN"];
		_ui = uiNamespace getVariable "ES_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		_xpLvl = 1;
		if(ES_xp_lvl >= 8) then {_xpLvl = 0.75;};
		if(ES_xp_lvl >= 15) then {_xpLvl = 0.65;};
		if(ES_xp_lvl >= 34) then {_xpLvl = 0.55;};
		while{true} do {
			if(animationState player != "Acts_carFixingWheel") then {
				[player,"Acts_carFixingWheel",true] remoteExec ["ES_fnc_animSync",-2];
				player switchMove "Acts_carFixingWheel";
				player playMoveNow "Acts_carFixingWheel";
			};
			
			sleep (0.400*_xpLvl);
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(ES_interrupted) exitWith {};
		};
		
		ES_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; ES_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};