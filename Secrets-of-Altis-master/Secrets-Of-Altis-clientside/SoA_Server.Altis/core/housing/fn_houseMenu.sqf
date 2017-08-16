#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_hudbig"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

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
_title ctrlSetText "Hausinteraktion";

{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>";} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[18983.6,8341.3,0],"Land_MilOffices_V1_F"]) == _curTarget) exitWith {
		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Repair"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		_Btn1 ctrlEnable true;
	};

	if((nearestObject [[3264.85,12481.7,0],"Land_i_Barracks_V2_F"]) == _curTarget) exitWith {

		if(_curTarget getVariable["restrained",false]) then {
			if(_curTarget getVariable["Escorting",false]) then {
				_Btn3 ctrlEnable true;
				_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_StopEscort"];
				_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting;";
			} else {
				_Btn3 ctrlEnable true;
				_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Escort"];
				_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
			};
		};

		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_Unrestrain"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
		_Btn1 ctrlEnable true;

		_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_CloseOpen"];
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_aufzuschliessen;";
		_Btn2 ctrlEnable true;
	};

	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_House_Raid_Owner"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
		_Btn1 ctrlEnable true;
		
		_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_BreakDown"];
		_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
		_Btn2 ctrlEnable true;
		
		_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_SearchHouse"];
		_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
		_Btn3 ctrlEnable true;
		
			if(player distance _curTarget > 3.6) then {
				_Btn3 ctrlEnable false;
			};
		
		_Btn4 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LockHouse"];
		_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
		_Btn4 ctrlEnable true;
	} else {
		closeDialog 0;
	};
};

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget]};
	_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_BuyHouse"];
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_Btn1 ctrlEnable true;
	
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		//_Btn1 ctrlEnable false;
		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_House_Raid_Owner"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
		_Btn1 ctrlEnable true;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_SellGarage"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlEnable true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_AccessGarage"];
		_Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlEnable true;
		
		_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_StoreVeh"];
		_Btn3 buttonSetAction "[life_pInact_curTarget,player,0,""car""] spawn life_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlEnable true;
	};

	
	if(_curTarget iskindof "Land_Chapel_V1_F") then {
		_Btn1 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Kirche verkaufen</t>";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlEnable true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LightsOn"];
		} else {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LightsOff"];
		};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_Btn2 ctrlEnable true;
		
		_Btn3 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>1. Glockenspiel</t>";
		_Btn3 buttonSetAction "[0,life_pInact_curTarget] spawn life_fnc_glockenspiel;";
		_Btn3 ctrlEnable true;
		
		_Btn4 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>2. Glockenspiel</t>";
		_Btn4 buttonSetAction "[1,life_pInact_curTarget] spawn life_fnc_glockenspiel;";
		_Btn4 ctrlEnable true;
		
		_Btn5 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Spendenhaus</t>";
		_Btn5 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_spendenhaus; closeDialog 0;";
		_Btn5 ctrlEnable true;
	};

	
	if(_curTarget iskindOF "House_F" && !(_curTarget iskindof "Land_Chapel_V1_F") && !(typeOf _curTarget in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"])) then {
		_Btn1 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_SellHouse"];
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlEnable true;
		
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_Btn1 ctrlEnable false;
		};
		
		if(_curTarget getVariable ["locked",false]) then {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_UnlockStorage"];
		} else {
			_Btn2 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LockStorage"];
		};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlEnable true;
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LightsOn"];
		} else {
			_Btn3 ctrlSetStructuredText parseText format["<t size='0.9' valign='middle' align='center'>%1</t>",localize "STR_pInAct_LightsOff"];
		};
		_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlEnable true;
	};
};

{_x ctrlCommit 0} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];