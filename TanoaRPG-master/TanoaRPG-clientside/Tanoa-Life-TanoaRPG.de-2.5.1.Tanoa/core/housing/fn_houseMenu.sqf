/*
	Author: Bryan "Tonic" Boardwine
	
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
#define Btn9 37458
#define Btn10 37459
#define Title 37401

systemChat "Debug: House Menu Start";


private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

systemChat format ["Debug: House Menu - Target %1",_curTarget];

if ((player distance dome) <= 50 || (player distance rsb) <= 50) then 
{
	systemChat "Debug: House Menu - Near Federal Reserve";
	if(isNull _curTarget) exitWith 
		{
			systemChat "Debug: House Menu - Null Target";
		};
} else {
	systemChat "Debug: House Menu - Not near Federal Reserve";
	if(isNull _curTarget) exitWith 
		{
			closeDialog 0;
			systemChat "Debug: House Menu - Null Target. Dialog closed.";
		};
		//Bad target
};
systemChat "Debug: House Menu - Running...";


_display = findDisplay 37400;
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

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	//if(((nearestObject [[13347,12035,0],"Land_ConcreteWall_01_l_gate_F"]) == _curTarget) OR ((nearestObject [[13229,12010,0],"Land_ConcreteWall_01_l_gate_F"]) == _curTarget) OR ((fed_bank getVariable ["Rsb", ObjNull]) == _curTarget) OR ((fed_bank getVariable ["Dome", ObjNull]) == _curTarget)) then {
	systemChat "Debug: House Menu - Target isKindOf House_F";
	if((dome == _curTarget) OR (rsb == _curTarget) OR ((fed_bank getVariable ["Rsb", ObjNull]) == _curTarget) OR ((fed_bank getVariable ["Dome", ObjNull]) == _curTarget)) then {
		systemChat "Debug: House Menu - Federal Reserve is current target";
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
		
	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			systemChat "Debug: House Menu - Target is not federal reserve - keys owned";
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;
			
			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};
			
			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};
systemChat "Debug: House Menu - Debug 10";


//NEW FED
if((dome == _curTarget) OR (rsb == _curTarget) OR ((fed_bank getVariable ["Rsb", ObjNull]) == _curTarget) OR ((fed_bank getVariable ["Dome", ObjNull]) == _curTarget)) then {
		if (true) exitWith
		{
			systemChat "Debug: House Menu - Federal Reserve is current target";
			_Btn1 ctrlSetText localize "STR_pInAct_Repair";
			_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_repairDoor; closeDialog 0;";
			_Btn1 ctrlShow true;
		
			_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
			_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_doorAnimate; closeDialog 0;";
			_Btn2 ctrlShow true;
		};
		
		
};



















_houseCfg = [(typeOf _curTarget)] call tanoarpg_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];};
	_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_buyHouse;";
	_Btn1 ctrlShow true;
	
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_House_Big_03_F","Land_FuelStation_01_workshop_F","Land_House_Big_02_F","Land_PierWooden_03_F","Land_PierWooden_02_hut_F","Land_GarageShelter_01_F"]) then {
		switch(typeOf _curTarget) do
		{
			case "Land_House_Big_03_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
		
				if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
					_Btn1 ctrlEnable false;
				};
		
				if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
					_Btn2 ctrlSetText localize "STR_pInAct_LightsOn";
				} else {
					_Btn2 ctrlSetText localize "STR_pInAct_LightsOff";
				};
				_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lightHouseAction; closeDialog 0;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn3 buttonSetAction "[life_pInact_curTarget,""Car"",[18,-4,0], 90] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn3 ctrlShow true;
				
				_Btn4 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn4 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn4 ctrlShow true;
			};
			
			case "Land_PierWooden_03_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
				
				_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn2 buttonSetAction "[life_pInact_curTarget,""Ship"",[8,6,0], 0] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn3 ctrlShow true;
			};
			
			case "Land_PierWooden_02_hut_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
				
				_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn2 buttonSetAction "[life_pInact_curTarget,""Ship"",[8,-6,0], 90] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn3 ctrlShow true;
			};
			
			case "Land_PierWooden_01_hut_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
				
				_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn2 buttonSetAction "[life_pInact_curTarget,""Ship"",[8,-6,0], 90] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn3 ctrlShow true;
			};
			
			case "Land_FuelStation_01_workshop_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
		
				if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
					_Btn1 ctrlEnable false;
				};
				
				_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn2 buttonSetAction "[life_pInact_curTarget,""Car"",[0,-12,0],180] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn3 ctrlShow true;
				
				if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
					_Btn4 ctrlSetText localize "STR_pInAct_LightsOn";
				} else {
					_Btn4 ctrlSetText localize "STR_pInAct_LightsOff";
				};
				_Btn4 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lightHouseAction; closeDialog 0;";
				_Btn4 ctrlShow true;
			};
			
			case "Land_House_Big_02_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
		
				if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
					_Btn1 ctrlEnable false;
				};
		
				if(_curTarget getVariable ["locked",false]) then {
					_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
				} else {
					_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
				};
				_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lockHouse; closeDialog 0;";
				_Btn2 ctrlShow true;
		
				if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
					_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
				} else {
					_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
				};
				_Btn3 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lightHouseAction; closeDialog 0;";
				_Btn3 ctrlShow true;
				
				_Btn4 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn4 buttonSetAction "[life_pInact_curTarget,""Car"",[17,7,0],90] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn4 ctrlShow true;
				
				_Btn5 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn5 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn5 ctrlShow true;
			};
			
			case "Land_GarageShelter_01_F":
			{
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
				_Btn1 ctrlShow true;
		
				if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
					_Btn1 ctrlEnable false;
				};
		
				if(_curTarget getVariable ["locked",false]) then {
					_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
				} else {
					_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
				};
				_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lockHouse; closeDialog 0;";
				_Btn2 ctrlShow true;
		
				if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
					_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
				} else {
					_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
				};
				_Btn3 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lightHouseAction; closeDialog 0;";
				_Btn3 ctrlShow true;
				
				_Btn4 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn4 buttonSetAction "[life_pInact_curTarget,""Car"",[2.5,-10,0],180] spawn tanoarpg_fnc_vehicleGarage; closeDialog 0;";
				_Btn4 ctrlShow true;
				
				_Btn5 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn5 buttonSetAction "[life_pInact_curTarget,player] spawn tanoarpg_fnc_storeVehicle; closeDialog 0;";
				_Btn5 ctrlShow true;
			};
		};
	} else {
		_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn tanoarpg_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
		} else {
			_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
		};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
		} else {
			_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
		};
		_Btn3 buttonSetAction "[life_pInact_curTarget] call tanoarpg_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;
	};
};