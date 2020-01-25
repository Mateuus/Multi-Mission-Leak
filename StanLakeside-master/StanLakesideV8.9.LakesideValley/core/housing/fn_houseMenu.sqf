/*
	
	
	Description:
	Building interaction menu
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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget) then {
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
		
	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;
			
			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};
			
			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];};
	_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_Btn1 ctrlShow true;

	_Btn2 ctrlSetText "House Price";
	_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_housePrice;";
	_Btn2 ctrlShow true;

	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		

		
		_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
		_Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
		_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
/*
		_Btn4 ctrlSetText "Give Key 2";
		_Btn4 buttonSetAction "[life_pInact_curTarget,2] call life_fnc_givekey1; closeDialog 0;";
		_Btn4 ctrlShow true;

		_Btn5 ctrlSetText "Give Key 3";
		_Btn5 buttonSetAction "[life_pInact_curTarget,3] call life_fnc_givekey1; closeDialog 0;";
		_Btn5 ctrlShow true;

		_Btn6 ctrlSetText "Give Key 4";
		_Btn6 buttonSetAction "[life_pInact_curTarget,4] call life_fnc_givekey1; closeDialog 0;";
		_Btn6 ctrlShow true;

		_Btn7 ctrlSetText "Give Key 5";
		_Btn7 buttonSetAction "[life_pInact_curTarget,5] call life_fnc_givekey1; closeDialog 0;";
		_Btn7 ctrlShow true;

		_Btn8 ctrlSetText "Change Locks";
		_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_wipekeys; closeDialog 0;";
		_Btn8 ctrlShow true;
*/
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
			_Btn4 ctrlEnable false;
			_Btn5 ctrlEnable false;
			_Btn6 ctrlEnable false;
			_Btn7 ctrlEnable false;
			_Btn8 ctrlEnable false;
		};

		if(!isNil {_curTarget getVariable "shared2"}) then {
			_btn4 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared3"}) then {
			_btn5 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared4"}) then {
			_btn6 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared5"}) then {
			_btn7 ctrlShow false;
		};


	} else {
		_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		

		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
		} else {
			_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
		};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;

/*
		_Btn3 ctrlSetText "Give Key 1";
		_Btn3 buttonSetAction "[life_pInact_curTarget,1] call life_fnc_givekey1; closeDialog 0;";
		_Btn3 ctrlShow true;

		_Btn4 ctrlSetText "Give Key 2";
		_Btn4 buttonSetAction "[life_pInact_curTarget,2] call life_fnc_givekey1; closeDialog 0;";
		_Btn4 ctrlShow true;

		_Btn5 ctrlSetText "Give Key 3";
		_Btn5 buttonSetAction "[life_pInact_curTarget,3] call life_fnc_givekey1; closeDialog 0;";
		_Btn5 ctrlShow true;

		_Btn6 ctrlSetText "Give Key 4";
		_Btn6 buttonSetAction "[life_pInact_curTarget,4] call life_fnc_givekey1; closeDialog 0;";
		_Btn6 ctrlShow true;

		_Btn7 ctrlSetText "Give Key 5";
		_Btn7 buttonSetAction "[life_pInact_curTarget,5] call life_fnc_givekey1; closeDialog 0;";
		_Btn7 ctrlShow true;

		_Btn8 ctrlSetText "Change Locks";
		_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_wipekeys; closeDialog 0;";
		_Btn8 ctrlShow true;
*/

		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
			_Btn3 ctrlEnable false;
			_Btn4 ctrlEnable false;
			_Btn5 ctrlEnable false;
			_Btn6 ctrlEnable false;
			_Btn7 ctrlEnable false;
			_Btn8 ctrlEnable false;
		};
		if(!isNil {_curTarget getVariable "shared1"}) then {
			_btn3 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared2"}) then {
			_btn4 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared3"}) then {
			_btn5 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared4"}) then {
			_btn6 ctrlShow false;
		};
		if(!isNil {_curTarget getVariable "shared5"}) then {
			_btn7 ctrlShow false;
		};
	};
};