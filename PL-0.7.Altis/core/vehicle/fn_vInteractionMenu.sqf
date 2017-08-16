#include "..\..\script_macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Modifier par BlackScaryZ pour une meilleur lecture et un meilleur fonctionnement
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
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_dlcVehicles"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;

_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
life_vInact_curTarget = _curTarget;
_dlcVehicles = ["C_Offroad_02_unarmed_F","B_T_LSV_01_unarmed_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"];
_adac = {_x getVariable ["job", 0] == 1} count playableUnits;
_copsc = west countSide playableUnits;

//Set Repair Action
if(life_job > 0 && life_adac_onduty) then {
	_Btn1 ctrlSetText localize "STR_vInAct_Repair";
	_Btn1 buttonSetAction "closeDialog 0;[life_vInact_curTarget] spawn life_fnc_adacrepairTruck;";
	if(life_inv_adactool > 0 && (damage _curTarget < 1) ) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;}
} else {
	_Btn1 ctrlSetText localize "STR_vInAct_Repair";
	_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;";
	if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
};
switch (playerSide) do {
	case west: {
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
		if (_adac <= 2) then {
			_Btn5 ctrlSetText localize "STR_vInAct_Impound";
			_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
		} else {
			_Btn5 ctrlSetText "Appeler Dep";
			_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
		};
		if(_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
			} else {
				if (_curTarget isKindOf "Air") then {
					_Btn6 ctrlShow false;
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPosATL life_vInact_curTarget select 0, getPosATL life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+1.5]; closeDialog 0;";
					if(count crew _curTarget == 0) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false;};
				};
			};
		};
		if (_adac <= 2) then {
			_Btn7 ctrlSetText "Appeler Dep";
			_Btn7 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
		} else {
			_Btn7 ctrlShow false;
		};
	};
	case east: {
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
		_Btn5 ctrlSetText "Appeler Dep";
		_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
		if(_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
			} else {
				if (_curTarget isKindOf "Air") then {
					_Btn6 ctrlShow false;
				} else {
					_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPosATL life_vInact_curTarget select 0, getPosATL life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+1.5]; closeDialog 0;";
					if(count crew _curTarget == 0) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false;};
				};
			};
		};
		_Btn7 ctrlShow false;
	};
	case civilian: {
		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn2 ctrlSetText "Conduire";
				};
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				if (_curTarget isKindOf "Air") then {
					_Btn2 ctrlShow false;
				} else {
					_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn2 buttonSetAction "if(speed life_vInact_curTarget < 10) then {life_vInact_curTarget setPos [getPosATl life_vInact_curTarget select 0, getPosATL life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+1.5];} else {hint ""Le véhicule doit être à l'arrêt !"";}; closeDialog 0;";
					if(count crew _curTarget == 0) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
				};
			};
		};
		if(typeOf _curTarget == "O_Truck_03_device_F") then {
			_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
			if(!isNil {(_curTarget getVariable "mining")} || !local _curTarget && {_curTarget in life_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {
			_Btn3 ctrlShow false;
		};
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
		if(life_job > 0 && life_adac_onduty) then {
			_Btn5 ctrlSetText "Dep terminé";
			_Btn5 buttonSetAction "closeDialog 0; [[cursorTarget],""life_fnc_deleteADAC"",civilian,FALSE] spawn life_fnc_MP;";
			_Btn6 ctrlSetText localize "STR_vInAct_Impound";
			_Btn6 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_impoundAction;";
			_Btn4 ctrlShow false;
		} else {
			_Btn5 ctrlSetText "Appeler Dep";
			_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
			_Btn6 ctrlShow false;
		};
		if(license_civ_rebel)then{_Btn4 ctrlShow true;};
    if (count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
    if(locked _curTarget != 0) then {_Btn4 ctrlEnable false;};
    if(!license_civ_rebel)then{_Btn4 ctrlShow false;};
		_Btn7 ctrlShow false;
	};
	case independent: {
		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn2 ctrlSetText "Conduire";
				};
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				if (_curTarget isKindOf "Air") then {
					_Btn2 ctrlShow false;
				} else {
					_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
					_Btn2 buttonSetAction "if(speed life_vInact_curTarget < 10) then {life_vInact_curTarget setPos [getPosATl life_vInact_curTarget select 0, getPosATL life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+1.5];} else {hint ""Le véhicule doit être à l'arrêt !"";}; closeDialog 0;";
					if(count crew _curTarget == 0) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
				};
			};
		};
		if (_adac <= 2 && _copsc == 0) then {
			_Btn3 ctrlSetText localize "STR_vInAct_Impound";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
		} else {
			_Btn3 ctrlSetText "Appeler Dep";
			_Btn3 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
		};
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
		if (_adac <= 2 && _copsc == 0) then {
			_Btn5 ctrlSetText "Appeler Dep";
			_Btn5 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_requestADAC;";
		} else {
			_Btn5 ctrlShow false;
		};
		_Btn6 ctrlSetText "Ouvrir/Fermer";
		_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockunlock;";
		_Btn7 ctrlShow false;
	};
};
