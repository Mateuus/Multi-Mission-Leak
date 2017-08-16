/*---------------------------------------------------------------------------
	File: fn_adacRepairTruck.sqf
	Author: Skrow & Skyfezzer

	Description:
	Main functionality for toolkits, to be revised in later version.
---------------------------------------------------------------------------*/

private["_veh","_upp","_ui","_damage","_progress","_pgText","_cP","_displayName","_bool"];
_veh = cursorTarget;
_bool = true;
life_interrupted = false;
/*_list = ((_veh isKindOf "B_Quadbike_01_F") OR (_veh isKindOf "C_Offroad_01_F") OR (_veh isKindOf "C_Hatchback_01_F") OR (_veh isKindOf "C_Offroad_02_unarmed_F") OR (_veh isKindOf "C_SUV_01_F") OR (_veh isKindOf "C_Hatchback_01_sport_F"));
_mark1 = getMarkerPos "adacl_3_1";
_mark2 = getMarkerPos "adacl_3_1_1";
_side = ({_x getVariable ["job", 0] == 1} count playableUnits > 2);
if(isNull _veh) exitwith {};
[[0,format["Dommage: %1 || adac on: %% ",_damage]],"life_fnc_broadcast" ,west,FALSE] call life_fnc_MP;

if(_side && _damage > 0.5 && _list && player distance _mark1 < 40) exitWith {
	hint "Le véhicle est trop endommagé, vous ne pouvez pas réparer le problème. Vous devez le remorquer vers la base des dépanneurs.";
};
if(_side && _damage > 0.5 && _list && player distance _mark2 < 40) exitWith {
	hint "Le véhicle est trop endommagé, vous ne pouvez pas réparer le problème. Vous devez le remorquer vers la base des dépanneurs.";
};*/

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {
	if(life_inv_adactool > 0) then {
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Réparation %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0;
		_time = 0.2;
		_cpUp = 0.008;

		while{true} do {
			if(_bool) then {
				[] spawn {
					_bool = false;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
					sleep 7;
					_bool = true;
				};
			};

		sleep _time;
		_cP = _cP + _cpUp;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(!alive player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(player != vehicle player) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(life_interrupted) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		};

		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Abgebrochen","PLAIN"]; life_action_inUse = false;_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
		if(player != vehicle player) exitWith {titleText["Vous devez sortir du véhicule afin de le réparer!","PLAIN"];_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};

		_veh setDamage 0;
		titleText["Véhicule réparé.","PLAIN"];
	};
};
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
