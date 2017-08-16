/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_addExpAmount","_profName","_repairtime","_data","_time","_multi"];
//SkillSystem
_profName = "Repair_Prof";
_repairtime = 1;
if(LHM_repair) exitWith {hint "Du willst mehrmals gleichzeitig reparieren?";};
LHM_repair = true;

//SkillSystem
_veh = cursorObject;
lhm_interrupted = false;
if(isNull _veh) exitwith {LHM_repair = false;};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		lhm_action_inUse = true;
		closeDialog 0;

		//SkillSystem
		_repairtime = (([_profName] call lhm_fnc_profData) select 0) / 100;
		//SkillSystem
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNameSpace getVariable "lhm_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		// Animation Fix Test
		if((weaponState player select 4) > 0) then {
			player action ["SwitchWeapon", player, player, 100];
		};
		waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};


		For "_i" from 0 to 1 step 0 do
		{
			// Animation Fix Test
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				 player action ["SwitchWeapon", player, player, 100];
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			 };
			 // Animation Fix Test
			sleep _repairtime; //SkillSystem Change (Old: sleep 0.5;)
			//sleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(isNull _veh) exitwith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if (speed player > 2) exitWith {};
			if(lhm_interrupted) exitWith {};
		};

		lhm_action_inUse = false;
		LHM_repair = false;
		if(isNull _veh) exitwith {};
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		player removeItem "ToolKit";
		//SkillSystem
		_addExpAmount = 50;
		if( _profName != "" ) then
		{
			[_profName,_addExpAmount] call lhm_fnc_addExp;
		};
		//SkillSystem
		//[_veh,"lhm_fnc_repairing"] call lhm_fnc_mp;
		_veh setDamage 0;

		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};
LHM_repair = false;