#include <macro.h>
/*
File: fn_vInteractionMenu.sqf
Author: Bryan "Tonic" Boardwine

Description:
Replaces the mass addactions for various vehicle actions
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_hudbig"];
if(!dialog) then {
createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_hudbig = _display displayCtrl 37401;

_hudselection = [] call life_fnc_hudcfg;
switch(((_hudselection select hudselection) select 3)) do {
	case 0: {_hudbig ctrlSetText "images\hud\hudleftbig.paa"};
	case 1: {_hudbig ctrlSetText "images\hud\hudleftbig2.paa"};
	case 2: {_hudbig ctrlSetText "images\hud\hudleftbig3.paa"};
	case 3: {_hudbig ctrlSetText "images\hud\hudleftbig4.paa"};
	case 4: {_hudbig ctrlSetText "images\hud\hudleftbig5.paa"};
	case 5: {_hudbig ctrlSetText ""};
};

_hudbig ctrlSetTextColor [1,1,1,1];

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

_title = _display displayCtrl 37403;
_title ctrlSetText "Fahrzeuginteraktion";

life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Repair"];
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide == west) then {

	_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_SearchVehicle"];
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";

	_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PullOut"];
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};

	_Btn4 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Impound"];
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";

	if(_curTarget isKindOf "Ship") then {
		_Btn5 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PushBoat"];
		_Btn5 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then {_Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"]) then {
		_Btn5 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_GetInKart"];
		_Btn5 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false};
	} else {
		_Btn5 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Unflip"];
		_Btn5 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+1.2]; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget}) then {_Btn5 ctrlEnable false;} else {_Btn5 ctrlEnable true;};
	};

		_Btn6 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>ADAC anrufen</t>";
		_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_ahwCallAction; closeDialog 0;";

	if(_curTarget isKindOf "Air") then {
		_Btn7 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Registration"];
		_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	} else {
		_Btn7 ctrlEnable false;
		_Btn7 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>";	
	};

		{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>"} foreach [_btn8,_btn9,_btn10];
	};
};

if (playerside == civilian) then {

	if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PushBoat"];
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F","C_Offroad_02_unarmed_F","B_T_LSV_01_unarmed_F","O_T_LSV_02_unarmed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","C_Scooter_Transport_01_F","I_C_Boat_Transport_02_F","C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"]) then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_GetInKart"];
			_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Unflip"];
			_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+1.2]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_DeviceMine"];
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
		_Btn3 ctrlEnable false;
	} else {
		_Btn3 ctrlEnable true;
	};
	} else {
		_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PullOut"];
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};
	};

	_Btn4 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>ADAC anrufen</t>";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_ahwCallAction; closeDialog 0;";

	{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>"} foreach [_btn5,_btn6,_btn7,_btn8,_btn9,_btn10];
};

if(playerSide == independent) then {

	if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PushBoat"];
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"]) then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_GetInKart"];
			_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Unflip"];
			_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPosATL life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+1.2]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};

	_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_PullOut"];
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};

	_Btn4 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Mitarbeiter rufen</t>";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_ahwCallAction; closeDialog 0;";

	if(typeOf (_curTarget) == "I_Truck_02_box_F") then {
		_Btn5 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Dekontaminieren</t>";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_medDekon; closeDialog 0;";
	} else {
		_Btn5 ctrlEnable false;
		_Btn5 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>";
	};

	if(_curTarget isKindOf "Air") then {
		_Btn6 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Beschlagnahmen</t>";
		_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	} else {
		_Btn6 ctrlEnable false;
		_Btn6 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>";
	};

	_Btn7 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_vInAct_Registration"];
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

	{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>"} foreach [_btn8,_btn9,_btn10];
};
