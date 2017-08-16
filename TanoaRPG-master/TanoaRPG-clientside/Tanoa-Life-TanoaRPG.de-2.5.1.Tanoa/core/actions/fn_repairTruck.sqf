/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repariere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		[_veh] remoteExec ["tanoarpg_fnc_RepairVehicleSound", -2, true];
		_veh setVariable ["Reparing", true, true];
		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel" ) then {
				player action ["SwitchWeapon", player, player, 100];
				player playMove "Acts_carFixingWheel";
				player playActionNow "stop";
				player playMove "Acts_carFixingWheel";
				player playActionNow "stop";
				player playMove "Acts_carFixingWheel";
			};
			sleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Reparieren abgebrochen","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du kannst das Fahrzeug nicht reparieren, während du drinnen sitzt, du Leuchte!","PLAIN"];};
		_veh setDamage 0;
		titleText["Du hast das Fahrzeug erfolgreich repariert.","PLAIN"];
	};
};