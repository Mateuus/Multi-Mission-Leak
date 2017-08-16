#include "..\..\script_macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_dlcVehicles"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;

_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_vInact_curTarget = _curTarget;
_dlcVehicles = ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"];

//Set Repair Action
_workshops = nearestobjects [life_vInact_curTarget, ["Land_FuelStation_01_workshop_F"],20];
if (count _workshops isEqualTo 0 ) then {
	_Btn1 ctrlSetText localize "STR_vInAct_Repair";
	_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repair_openMenu;";
} else {
	_Btn1 ctrlSetText localize "STR_vInAct_Repair2";
	_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_askMechanic;";
};

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide isEqualTo west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget isEqualTo 0) then {_Btn4 ctrlEnable false;};
	
	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	
	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in _dlcVehicles) then {
			if(_curTarget isKindOf "Air") then {
				_Btn6 ctrlSetText localize "STR_vInAct_GetInHeli";
			} else {
				_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			};
			_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget isEqualTo 0 && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget isEqualTo 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		};
	};
	
	_Btn7 ctrlSetText "THW Rufen";
	_Btn7 buttonSetAction "[] spawn life_fnc_pannenCall;closeDialog 0;";
	_THWonline = independent countSide playableUnits;
	if(_THWonline > 0) then {
		if(!(cursorTarget GVAR "calledTHW")) then {
			_Btn7 ctrlShow true;
		} else {
			_Btn7 ctrlShow false;
		};
	} else {
		_Btn7 ctrlShow false;
	};
	
	_Btn8 ctrlSetText localize "STR_vInAct_Delete";
	_Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deleteAction;";
	
	
	if(!((player distance (getMarkerPos "cop_spawn_1") < 30) OR  (player distance (getMarkerPos "cop_spawn_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_4") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then {
		_Btn8 ctrlEnable false;
	};
};

if(playerSide isEqualTo independent) then {
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
		
		_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget isEqualTo 0) then {_Btn3 ctrlEnable false;};
		
		_Btn4 ctrlSetText localize "STR_vInAct_Impound";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_THWimpoundAction;";

		_Btn5 ctrlSetText "Auftrag beenden!";
		_Btn5 buttonSetAction "[] spawn life_fnc_pannenHelp;closeDialog 0;";
		if(_curTarget GVAR "calledTHW") then {
			_Btn5 ctrlShow true;
		} else {
			_Btn5 ctrlShow false;
		};
		
		if(_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in _dlcVehicles) then {
				if(_curTarget isKindOf "Air") then {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget isEqualTo 0 && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
			} else {
				_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget isEqualTo 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
			};
		};
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
};

if(playerSide isEqualTo civilian) then {
		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualTo 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in _dlcVehicles) then {
				if(_curTarget isKindOf "Air") then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget isEqualTo 0 && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget isEqualTo 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};
		
		if(typeOf _curTarget isEqualTo "O_Truck_03_device_F") then {
			_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
			if(!isNil {(_curTarget GVAR "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {
			_Btn3 ctrlShow false;
		};
	
		_Btn8 ctrlSetText "THW Rufen";
		_Btn8 buttonSetAction "[] spawn life_fnc_pannenCall;closeDialog 0;";
		_THWonline = independent countSide playableUnits;
		if(_THWonline > 0) then {
			if(!(cursorTarget GVAR "calledTHW")) then {
				_Btn8 ctrlShow true;
			} else {
				_Btn8 ctrlShow false;
			};
		} else {
			_Btn8 ctrlShow false;
		};

	_Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
};