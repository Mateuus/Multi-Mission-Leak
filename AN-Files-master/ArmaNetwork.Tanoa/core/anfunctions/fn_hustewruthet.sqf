/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_progressTime","_anim","_pgText","_cP","_displayName","_test"];
_veh = cursorObject;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "Tank")) then {
	if("ToolKit" in (items player)) then {
		life_action_inUse = true;
		player playActionNow "stop";
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		//Setup our progress bar.
		disableSerialization;
		_progressBar = [] call life_fnc_tufruxatra;
		_progress = _progressBar select 1;
		_progressText = _progressBar select 2;
		_progressText ctrlSetText format ["Repairing %1...", _displayName];

		_progressTime = (19.5 / (1 / 0.006));
		_anim = ["repairs"] call life_fnc_yufanuyaw;
		[player,"repair",50] remoteExecCall ["life_fnc_quvucamaph",-2];

		for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
			_progress progressSetPosition _i;
			sleep _progressTime;
			if(player distance _veh > 6) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		terminate _anim;
		player playActionNow "stop";
		life_action_inUse = false;
		[false] call life_fnc_tufruxatra;
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		if(player distance _veh > 6) exitWith {};
		_veh setDamage 0;
		[true,150] call life_fnc_thagayazapu;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	} else {
		_exp = if("mechanic" in AN_Skills) then {if("mechanicOne" in AN_Skills) then {58.5} else {39};} else {0};
		if(playerside isEqualTo civilian) then {_exp = _exp} else {_exp = 70;};
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		//Setup our progress bar.
		disableSerialization;
		_progressBar = [] call life_fnc_tufruxatra;
		_progress = _progressBar select 1;
		_progressText = _progressBar select 2;
		_progressText ctrlSetText format ["Repairing %1...", _displayName];
		_progressTime = ((78 - _exp)/(1 / 0.006));
		_anim = ["repairs"] call life_fnc_yufanuyaw;
		[player,"repair",50] remoteExecCall ["life_fnc_quvucamaph",-2];

		for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
			_progress progressSetPosition _i;
			sleep _progressTime;
			if(player distance _veh > 6) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
			if(life_istazed) exitWith {};
		};
		terminate _anim;
		player playActionNow "stop";
		life_action_inUse = false;
		[false] call life_fnc_tufruxatra;
		if(life_istazed) exitWith {};
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		if(!alive player) exitWith {};
		if(player distance _veh > 6) exitWith {};
		_veh setDamage 0;
		[true,150] call life_fnc_thagayazapu;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};
