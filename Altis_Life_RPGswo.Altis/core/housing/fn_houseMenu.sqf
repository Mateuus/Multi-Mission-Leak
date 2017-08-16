/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/

#include "..\..\macros.hpp"

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Title"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if ((side player) == independent OR (side player) == opfor) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl IDC_interact_Btn1;
_Btn2 = _display displayCtrl IDC_interact_Btn2;
_Btn3 = _display displayCtrl IDC_interact_Btn3;
_Btn4 = _display displayCtrl IDC_interact_Btn4;
_Btn5 = _display displayCtrl IDC_interact_Btn5;
_Btn6 = _display displayCtrl IDC_interact_Btn6;
_Btn7 = _display displayCtrl IDC_interact_Btn7;
_Btn8 = _display displayCtrl IDC_interact_Btn8;
_Btn9 = _display displayCtrl IDC_interact_Btn9;
_Btn10 = _display displayCtrl IDC_interact_Btn10;
_Btn11 = _display displayCtrl IDC_interact_Btn11;
_Btn12 = _display displayCtrl IDC_interact_Btn12;
_Btn13 = _display displayCtrl IDC_interact_Btn13;
_Btn14 = _display displayCtrl IDC_interact_Btn14;
_Title = _display displayCtrl IDC_interact_Title;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
_Btn11 ctrlShow false;
_Btn12 ctrlShow false;
_Btn13 ctrlShow false;
_Btn14 ctrlShow false;

_Title ctrlSetText "Haus Interaktions-Menü";

DWEV_pInact_curTarget = _curTarget;

if(_curTarget isKindOf "House_F" && (side player) == west) exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		
		_Btn1 ctrlSetText "Tür Reparieren";
		_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText "Öffnen / Schließen";
		_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
		
	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn1 ctrlSetText "Hausbesitzer";
			_Btn1 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText "Haus Aufbrechen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;
/*			
			_Btn3 ctrlSetText "Haus Durchsuchen";
			_Btn3 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};*/
			
			_Btn3 ctrlSetText "Haus verschließen";
			_Btn3 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_lockupHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

_houseCfg = [(typeOf _curTarget)] call DWEV_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in DWEV_vehicles)) then {
	_Btn1 ctrlSetText "Haus Kaufen";
	_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_buyHouse;";
	_Btn1 ctrlShow true;
	
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_Garage_V1_dam_F"]) then {
		_Btn1 ctrlSetText "Garage verkaufen";
		_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};

		_Btn2 ctrlSetText "Fahrzeug Garage";
		_Btn2 buttonSetAction "[DWEV_pInact_curTarget,""Car""] spawn DWEV_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		_Btn3 ctrlSetText "Fahrzeug Einparken";
		_Btn3 buttonSetAction "[DWEV_pInact_curTarget,player] spawn DWEV_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
	} else {
		_Btn1 ctrlSetText "Haus verkaufen";
		_Btn1 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn6 ctrlSetText "Sicherheitssystem";
		_Btn6 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_secureHouse; closeDialog 0;";
		_Btn6 ctrlShow true;
		
		_Btn7 ctrlSetText "Lageriste plazieren";
		_Btn7 buttonSetAction "[DWEV_pInact_curTarget] spawn DWEV_fnc_storageBox; closeDialog 0;";
		_Btn7 ctrlShow true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
		_Btn1 ctrlEnable false;
		_Btn6 ctrlEnable false;
		_Btn7 ctrlEnable false;
		};
		
		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText "Lagerhaus aufschließen";
		} else {
			_Btn2 ctrlSetText "Lagerhaus zuschließen";
		};
		_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn3 ctrlSetText "Licht anschalten";
		} else {
			_Btn3 ctrlSetText "Licht ausschalten";
		};
		_Btn3 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;
	};
};