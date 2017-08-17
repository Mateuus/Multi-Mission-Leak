#include "..\..\script_macros.hpp"
/*
    File: fn_houseMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Building interaction menu
*/
#define Btn1C 654561
#define Btn2C 654562
#define Btn3C 654563
#define Btn4C 654564
#define Btn1CI 5195191
#define Btn2CI 5195192
#define Btn3CI 5195193
#define Btn4CI 5195194
#define Btn5CI 5195195
#define Btn1CIG 456541
#define Btn2CIG 456542
#define Btn3CIG 456543

private ["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
disableSerialization;
_curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {}; //Bad target
_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if (count _houseCfg isEqualTo 0 && playerSide isEqualTo civilian) exitWith {};

life_pInact_curTarget = _curTarget;

if (_curTarget in life_hideoutBuildings) exitWith {
    closeDialog 0;
    [localize "STR_House_Hideout",true,"slow"] call life_fnc_notificationSystem;
};

if (_curTarget isKindOf "House_F" && playerSide isEqualTo west) exitWith {

	if (!dialog) then {
		createDialog "life_copHInteraction";
	};

	_Btn1 = CONTROL(65456,Btn1C);
	_Btn2 = CONTROL(65456,Btn2C);
	_Btn3 = CONTROL(65456,Btn3C);
	_Btn4 = CONTROL(65456,Btn4C);
	
	{_x ctrlEnable false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4];

    if (!isNil {_curTarget getVariable "house_owner"}) then {
        _Btn1 ctrlSetTooltip localize "STR_House_Raid_Owner";
        _Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
        _Btn1 ctrlEnable true;

        _Btn2 ctrlSetTooltip localize "STR_pInAct_BreakDown";
        _Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
        _Btn2 ctrlEnable true;

        _Btn3 ctrlSetTooltip localize "STR_pInAct_SearchHouse";
        _Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
        _Btn3 ctrlEnable true;

        if (player distance _curTarget > 3.6) then {
            _Btn3 ctrlEnable false;
        };

        _Btn4 ctrlSetTooltip localize "STR_pInAct_LockHouse";
        _Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
        _Btn4 ctrlEnable true;
    } else {
        closeDialog 0;
    };
};

if (!(_curTarget in life_vehicles) || isNil {_curTarget getVariable "house_owner"}) then {
	if (isClass (missionConfigFile >> "Housing" >> worldName >> (typeOf _curTarget))) then {
		if (!dialog) then {
			createDialog "life_civHInteraction";
		};

		_Btn1 = CONTROL(519519,Btn1CI);
		_Btn2 = CONTROL(519519,Btn2CI);
		_Btn3 = CONTROL(519519,Btn3CI);
		_Btn4 = CONTROL(519519,Btn4CI);
		_Btn5 = CONTROL(519519,Btn5CI);
		
		{_x ctrlEnable false;} forEach [_Btn1,_Btn3,_Btn4,_Btn5];

		private _isHouse = false;

		_Btn2 ctrlSetTooltip localize "STR_pInAct_BuyHouse";
		_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
		_isHouse = true;
		
		if (!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn2 ctrlEnable false;
		};
    } else {
		if (!dialog) then {
			createDialog "life_civHGInteraction";
		};
		
		_Btn1 = CONTROL(45654,Btn1CIG);
		_Btn2 = CONTROL(45654,Btn2CIG);
		_Btn3 = CONTROL(45654,Btn3CIG);
		
		{_x ctrlEnable false;} forEach [_Btn2,_Btn3];
		
        _Btn1 ctrlSetTooltip localize "STR_pInAct_BuyGarage";
        _Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
		
		
		if (!isNil {_curTarget getVariable "house_owner"}) then {
			_Btn1 ctrlEnable false;
		};
    };
} else {
    if (isClass (missionConfigFile >> "Garages" >> worldName >> (typeOf _curTarget))) then {
		if (!dialog) then {
			createDialog "life_civHGInteraction";
		};
		
		_Btn1 = CONTROL(45654,Btn1CIG);
		_Btn2 = CONTROL(45654,Btn2CIG);
		_Btn3 = CONTROL(45654,Btn3CIG);
		
		{_x ctrlEnable false;} forEach [_Btn1,_Btn2,_Btn3];
		
        _Btn3 ctrlSetText localize "STR_pInAct_SellGarage";
        _Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
        _Btn3 ctrlEnable true;

        if (((_curTarget getVariable "house_owner") select 0) != getPlayerUID player) then {
            _Btn3 ctrlEnable false;
        };

        _Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
        _Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
        _Btn2 ctrlEnable true;

        _Btn1 ctrlSetText localize "STR_pInAct_StoreVeh";
        _Btn1 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
        _Btn1 ctrlEnable true;
    } else {
		if (!dialog) then {
			createDialog "life_civHInteraction";
		};
		
		_Btn1 = CONTROL(519519,Btn1CI);
		_Btn2 = CONTROL(519519,Btn2CI);
		_Btn3 = CONTROL(519519,Btn3CI);
		_Btn4 = CONTROL(519519,Btn4CI);
		_Btn5 = CONTROL(519519,Btn5CI);
			
		{_x ctrlEnable false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5];
			
        _Btn1 ctrlSetTooltip localize "STR_pInAct_SellHouse";
        _Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
        _Btn1 ctrlEnable true;

        if (((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
            _Btn1 ctrlEnable false;
        };

        if (_curTarget getVariable ["locked",false]) then {
            _Btn3 ctrlSetTooltip localize "STR_pInAct_UnlockStorage";
			_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
			_Btn3 ctrlEnable true;
			_Btn4 ctrlEnable false; 
        } else {
            _Btn4 ctrlSetTooltip localize "STR_pInAct_LockStorage";
			_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
			_Btn4 ctrlEnable true;
			_Btn3 ctrlEnable false; 
        };

        if (isNull (_curTarget getVariable ["lightSource",objNull])) then {
            _Btn5 ctrlSetTooltip localize "STR_pInAct_LightsOn";
        } else {
            _Btn5 ctrlSetTooltip localize "STR_pInAct_LightsOff";
        };
        _Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
        _Btn5 ctrlEnable true;
    };
};
