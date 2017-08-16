/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 2400
#define Btn2 2401
#define Btn3 2402
#define Btn4 2403
#define Btn5 2404
#define Btn6 2405
#define Btn7 2406
#define Btn8 2407
#define Btn9 2408
#define Btn10 2409
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "interactionmenu_loewenherz";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 999;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
lhm_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_repairTruck; closeDialog 0;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide == west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_searchVehAction; closeDialog 0;";

	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_vehInvSearch; closeDialog 0;";

	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_pulloutAction; closeDialog 0;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_impoundAction;";

	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn lhm_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in
		[
		"C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_F",
		"B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F",
		"O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F",
		"O_Heli_Transport_04_repair_F"
		]
		) then {
			_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn6 buttonSetAction "player moveInDriver lhm_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "lhm_vInact_curTarget setPos [getPos lhm_vInact_curTarget select 0, getPos lhm_vInact_curTarget select 1, (getPos lhm_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		};
	};

	if(_curTarget iskindof "Land_Pod_Heli_Transport_04_medevac_F") then {
		_Btn7 ctrlSetText localize "STR_pAct_hunger";
		_Btn7 buttonSetAction "[] spawn lhm_fnc_hunger; closeDialog 0;";

		_Btn8 ctrlSetText localize "STR_pAct_trinken";
		_Btn8 buttonSetAction "[] spawn lhm_fnc_trinken; closeDialog 0;";

		_Btn2 ctrlSetText localize "STR_pAct_trinken";
		_Btn2 buttonSetAction "[] spawn lhm_fnc_trinken; closeDialog 0;";

	} else {
		if(_curTarget iskindof "LandVehicle") then {
			_Btn7 ctrlSetText "Untersuchen";
			_Btn7 buttonSetAction "[] spawn lhm_fnc_searchVehInj; closeDialog 0;";
			_Btn8 ctrlShow false;
		} else {
			_Btn7 ctrlShow false;
			_Btn8 ctrlShow false;
		};
	};

	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;

} else {

	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn lhm_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn2 buttonSetAction "player moveInDriver lhm_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "lhm_vInact_curTarget setPos [getPos lhm_vInact_curTarget select 0, getPos lhm_vInact_curTarget select 1, (getPos lhm_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && (getposatl player distance [3679.64,13290.2,4.53852] > 20 )) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn3 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_deviceMine; closeDialog 0;";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in lhm_vehicles}) then {
			_Btn3 ctrlEnable false;
		} else {
			_Btn3 ctrlEnable true;
		};
	} else {

		if(typeof _curTarget == "I_Truck_02_ammo_F") then {
			_Btn3 ctrlSetText "Verarbeite";
			_Btn3 buttonSetAction "[lhm_vInact_curTarget] spawn lhm_fnc_procMeth; closeDialog 0;";
		} else {
			_Btn3 ctrlShow false;
		};

	};

	if(_curTarget iskindof "Land_Pod_Heli_Transport_04_medevac_F" ) then {
			_Btn4 ctrlSetText localize "STR_pAct_hunger";
			_Btn4 buttonSetAction "[] spawn lhm_fnc_hunger; closeDialog 0;";

			_Btn5 ctrlSetText localize "STR_pAct_trinken";
			_Btn5 buttonSetAction "[] spawn lhm_fnc_trinken; closeDialog 0;";

				if(playerside == independent) then {
					_Btn6 ctrlSetText "Aufsammeln";
					_Btn6 buttonSetAction "[] spawn lhm_fnc_packupcontainer; closeDialog 0;";
				} else {
					_Btn6 ctrlShow false;
				};
	} else {
			if(playerside == independent) then {
					_Btn4 ctrlShow false;
					_Btn5 ctrlShow false;
					_Btn6 ctrlShow false;
					if (typeof(_curTarget) in ["I_MRAP_03_F","O_MRAP_02_F","O_MRAP_02_hmg_F","B_MRAP_01_F","B_MRAP_01_hmg_F","C_Offroad_01_F","I_G_Offroad_01_F","B_G_Offroad_01_armed_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Quadbike_01_F","C_Van_01_transport_F","C_Van_01_box_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","I_Truck_02_transport_F","I_Truck_02_covered_F"] && count(nearestObjects [getposatl(player), ["B_Truck_01_mover_F"], 15])!= 0) then
					{
						_Btn4 ctrlShow true;
						_Btn4 ctrlSetText "Tow Vehicle";
						_Btn4 buttonSetAction "[] spawn lhm_fnc_towTruck; closeDialog 0;";
					};
					if(_curTarget iskindof "B_Truck_01_mover_F" && playerside == independent && _curTarget getvariable "tow_status" == "towing") then
					{
						_Btn4 ctrlShow true;
						_Btn4 ctrlSetText "Untow";
						_Btn4 buttonSetAction "[] spawn lhm_fnc_untowTruck; closeDialog 0;";
					};
			} else {
					_Btn4 ctrlShow false;
					_Btn5 ctrlShow false;
					_Btn6 ctrlShow false;
			};
	};

	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
};