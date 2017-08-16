#include "..\..\script_macros.hpp"
/*
	File: fn_repair_action.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
if (life_action_inUse) exitWith {};
private ["_veh","_repPart","_ItemName"];
_veh = param [0,ObjNull,[ObjNull]];
if(count crew _veh >= 1) exitWith {hint "Du kannst das Fahrzeug nicht reparieren so lange sich Personen darin befinden!";};

_repPart = param [1,"",[""]];
_ItemName = param [2,"",[""]];

if(isNull _veh) exitWith {closeDialog 0;hint "Vor dir ist kein Fahrzeug!";};
if(player distance _veh > 10) exitWith {closeDialog 0;hint "Du bist zu weit weg!";};

if(_repPart in ["HitLFWheel","HitLF2Wheel","HitLMWheel","HitLBWheel","HitRFWheel","HitRF2Wheel","HitRMWheel","HitRBWheel"]) then {if(life_inv_wheel isEqualTo 0) exitWith {hint "Um den Reifen zu reparieren musst du einen Reifen im Inventar haben!"};};
if(_repPart isEqualTo "HitEngine") then {if(life_inv_engine isEqualTo 0) exitWith {hint "Um den Motor zu reparieren musst du einen Motor im Inventar haben!"};};
if(_repPart isEqualTo "HitFuel") then {if(life_inv_fueltank isEqualTo 0) exitWith {hint "Um den Treibstofftank zu reparieren musst du einen Treibstofftank im Inventar haben!"};};
if(_repPart in ["HitBody","HitHull"]) then {if(life_inv_hull isEqualTo 0) exitWith {hint "Um die Karosserie zu reparieren musst du ein Fahrzeugteil im Inventar haben!"};};
if(_repPart isEqualTo "HitAvionics") then {if(life_inv_Avionics isEqualTo 0) exitWith {hint "Um die Instrumente zu reparieren musst du Instrumente im Inventar haben!"};};
if(_repPart isEqualTo "HitHRotor") then {if(life_inv_HRotor isEqualTo 0) exitWith {hint "Um den Main Rotor zu reparieren musst du einen Main Rotor im Inventar haben!"};};
if(_repPart isEqualTo "HitVRotor") then {if(life_inv_VRotor isEqualTo 0) exitWith {hint "Um den Heck Rotor zu reparieren musst du einen Heck Rotor im Inventar haben!"};};

if(([false,_ItemName,1] call life_fnc_handleInv)) then {
	life_interrupted = false;
	if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {
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

			while{true} do {
				if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
					player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};

				sleep 0.01;
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
			if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
			if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
			switch (true) do {
				case (_repPart isEqualTo "HitEngine"): {[0,_veh] remoteExecCall ["life_fnc_vehicleRepair",RANY];};
				case (_repPart in ["HitBody","HitHull"]): {_veh setDamage 0;};
				default {[1,_veh,_repPart] remoteExecCall ["life_fnc_vehicleRepair",RANY];};
			};
		};
	};
};