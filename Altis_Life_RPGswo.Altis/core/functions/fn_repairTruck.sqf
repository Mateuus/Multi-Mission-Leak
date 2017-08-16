/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
DWEV_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		DWEV_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repariere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNameSpace getVariable "DWEV_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(DWEV_interrupted) exitWith {};
			if(!("ToolKit" in (items player))) exitWith {};
		};
		
		DWEV_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du kannst nicht im Fahrzeug sitzen während du es reparierst.","PLAIN"];};
		if(player != vehicle player) exitWith {titleText["Du kannst nicht im Fahrzeug sitzen während du es reparierst.","PLAIN"];};
		if(!("ToolKit" in (items player))) exitWith {titleText["Aktion abgebrochen! Dein Werkzeugkasten wurde dir möglicherweise geklaut","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		[_veh] spawn DWEV_fnc_handleVehRepair;
		titleText["Du hast das Fahrzeug repariert.","PLAIN"];
	};
};
