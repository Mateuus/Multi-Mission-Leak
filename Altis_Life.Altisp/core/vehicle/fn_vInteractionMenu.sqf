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
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;";

if((life_inv_toolkit >= 1) && {alive life_vInact_curTarget} && {([life_vInact_curTarget] call life_fnc_isDamaged)}) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

switch(playerSide) do {
	case west: {

		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";

		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

		if(_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(alive _curTarget && _curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
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
				_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_unflip; closeDialog 0;";
				if(alive _curTarget && {count crew _curTarget == 0} && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
			};
		};

		_Btn7 ctrlSetText localize "STR_vInAct_SeizeVeh";
		_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_seizeVehAction; closeDialog 0;";

		_Btn8 ctrlSetText localize "STR_vInAct_ParkingTicket";
		_Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_parkingTicket; closeDialog 0;";
	};

	case civilian: {

		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(alive _curTarget && _curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_unflip; closeDialog 0;";
				if(alive _curTarget && {count crew _curTarget == 0} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};

		if(_curTarget in life_vehicles) then {
			_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
		} else {
			_Btn3 ctrlShow false;
		};
		if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};

		if(typeOf _curTarget == "O_Truck_03_device_F") then {
			_Btn4 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine; closeDialog 0;";
			if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
				_Btn4 ctrlEnable false;
			} else {
				_Btn4 ctrlEnable true;
			};
		} else {
			_Btn4 ctrlShow false;
			if(typeOf (_curTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"] && _curTarget in life_vehicles) then {
				if(!isNil {_curTarget getVariable "fuelTankWork"}) then {
					_Btn4 ctrlSetText localize "STR_FuelTank_Stop";
					_Btn4 buttonSetAction "life_vInact_curTarget setVariable [""fuelTankWork"",nil,true];closeDialog 0;";
					_Btn4 ctrlShow true;
				} else {
					if(count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) > 0) then {
						_Btn4 ctrlSetText localize "STR_FuelTank_Supply";
						_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelSupply";
						_Btn4 ctrlShow true;
					}else{
						{
							if(player distance (getMarkerPos _x) < 20) exitWith {
								_Btn4 ctrlSetText localize "STR_FuelTank_Store";
								_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelStore";
								_Btn4 ctrlShow true;
							};
						} forEach ["fuel_storage_1","fuel_storage_2"];
					};
				};
			};
		};



		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
	};

	case independent: {

		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(alive _curTarget && _curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if((typeOf (_curTarget) in _dlcVehicles) && !(288520 in getDLCs 1)) then {
				if(_curTarget isKindOf "Air") then {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInHeli";
				} else {
					_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				};
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_unflip; closeDialog 0;";
				if(alive _curTarget && {count crew _curTarget == 0} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};

		_Btn3 ctrlSetText localize "STR_vInAct_Registration";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
	};
};
