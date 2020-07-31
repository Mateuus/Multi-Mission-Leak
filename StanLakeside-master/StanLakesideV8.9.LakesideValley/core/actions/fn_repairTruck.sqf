/*
	File: fn_repairTruck.sqf
	
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if(player getVariable ["restrained",false] || player getVariable ["tied",false]) exitWith {["Nie mozesz naprawiac pojazdu gdy masz rece za plecami", false] spawn domsg};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Bicycle") OR (_veh isKindOf "Motorbike") OR (_veh isKindOf "Motorcycle") OR (_veh isKindOf "Air") OR (_veh isKindOf "A3L_Tahoe_Base")) then
{
	_cP = 0;
	if(karma_level > 0) then {
		_cp = karma_level / 100;
	};
	if(_cp > 0.5) then {
		_cp = 0.5;
	};
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition _cp;

		playSound3D ["cg_sndimg\sounds\repair.ogg", player, false, getPosASL player, 1, 1, 125];

		while{true} do
		{
			uiSleep 0.75;
			if(animationState player != "Acts_carFixingWheel") then {
				player playmovenow "Acts_carFixingWheel";  
				player disableAI "anim"; 
			};
			if (player distance _veh > 4) exitwith {life_interrupted = true};
			_cP = _cP + 0.05;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1 || deadPlayer || player != vehicle player || life_interrupted) exitWith {};
			if(player getVariable ["restrained",false] || player getVariable ["tied",false]) exitWith {["Nie mozesz naprawiac pojazdu gdy masz rece za plecami", false] spawn domsg};
		};
		player switchmove "";
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", false] spawn domsg; life_action_inUse = false;};
		if(player != vehicle player) exitWith {[localize "STR_NOTF_RepairingInVehicle", false] spawn domsg;};
		_veh setDamage 0;
		[localize "STR_NOTF_RepairedVehicle", false] spawn domsg;
	} else {
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition _cp;

		playSound3D ["cg_sndimg\sounds\repair.ogg", player, false, getPosASL player, 1, 1, 125];

		while{true} do
		{
			uiSleep 1.5;
			if(animationState player != "Acts_carFixingWheel") then {
				player playmovenow "Acts_carFixingWheel";  
				player disableAI "anim"; 
			};
			if (player distance _veh > 4) exitwith {life_interrupted = true};
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1 || deadPlayer || player != vehicle player || life_interrupted) exitWith {};
			if(player getVariable ["restrained",false] || player getVariable ["tied",false]) exitWith {["Nie mozesz naprawiac pojazdu gdy masz rece za plecami", false] spawn domsg};			
		};
		player switchmove "";
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", false] spawn domsg; life_action_inUse = false;};
		if(player != vehicle player) exitWith {[localize "STR_NOTF_RepairingInVehicle", false] spawn domsg;};
		_veh setDamage 0;
		[localize "STR_NOTF_RepairedVehicle", false] spawn domsg;
	};
};