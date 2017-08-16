#include "..\..\script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
	if("ToolKit" in (items player)) then {
		life_action_inUse = true;
		_displayName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _veh),"displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];

		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		playSound "Acts_carFixingWheel";
		playSound "Acts_carFixingWheel";

		_anim = "";
		_rand = random 100;
		if (_rand < 60) then {
			if (_rand < 25) then {
				_anim = "InBaseMoves_repairVehiclePne";
			} else {
				_anim = "InBaseMoves_assemblingVehicleErc";
			};
		} else {
			_anim = "InBaseMoves_repairVehicleKnl";
		};


		while{true} do {
			if (animationState player != _anim) then { // AinvPknlMstpSnonWnonDnon_medic_1 // InBaseMoves_assemblingVehicleErc
			[player,_anim,true] remoteExecCall ["life_fnc_animSync",RCLIENT];
			player switchMove _anim;
			player playMoveNow _anim;
		};

			sleep 0.27; // 3 fois 6.5 secondes = 19,5secondes
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 0.5 && !_sound) then {_sound = true; playSound "Acts_carFixingWheel"; playSound "Acts_carFixingWheel";};
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
//		if(license_civ_depanneur) exitWith {_veh setDamage 0; titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};
