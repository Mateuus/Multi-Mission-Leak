
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Building interaction menu
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


private ["_curTarget","_houseCfg","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {}; //Bad target
_houseCfg = [(typeOf _curTarget)] call lhm_fnc_houseConfig;
if(count _houseCfg isEqualTo 0 && playerSide isEqualTo civilian) exitWith {};

if(!dialog) then {
	createDialog "interactionmenu_loewenherz";
};

_Btn1 = (findDisplay 999) displayCtrl Btn1;
_Btn2 = (findDisplay 999) displayCtrl Btn2;
_Btn3 = (findDisplay 999) displayCtrl Btn3;
_Btn4 = (findDisplay 999) displayCtrl Btn4;
_Btn5 = (findDisplay 999) displayCtrl Btn5;
_Btn6 = (findDisplay 999) displayCtrl Btn6;
_Btn7 = (findDisplay 999) displayCtrl Btn7;
_Btn8 = (findDisplay 999) displayCtrl Btn8;
_Btn9 = (findDisplay 999) displayCtrl Btn9;
_Btn10 =  (findDisplay 999) displayCtrl Btn10;

{_x ctrlShow false;} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];

lhm_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide isEqualTo west) exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {

		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;

		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;

	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;

			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;

			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;

			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};

			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

if(!(_curTarget in lhm_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in lhm_vehicles) then {lhm_vehicles = lhm_vehicles - [_curTarget];};
	_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
	_Btn1 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_buyHouse;";
	_Btn1 ctrlShow true;

	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
		_Btn1 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;

		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};

		_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
		_Btn2 buttonSetAction "[lhm_pInact_curTarget,""Car""] spawn lhm_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;

		_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
		_Btn3 buttonSetAction "[lhm_pInact_curTarget,player] spawn lhm_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
	} else {
		_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
		_Btn1 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;

		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};

		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
		} else {
			_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
		};
		_Btn2 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;

		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
		} else {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
		};
		_Btn3 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;
	};
};