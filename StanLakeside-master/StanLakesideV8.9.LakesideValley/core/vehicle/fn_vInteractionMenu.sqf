/*
	File: fn_vInteractionMenu.sqf
	
	
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
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Btn14 37463
#define Btn15 37464
#define Btn16 37465
#define Btn17 37466
#define Btn18 37467
#define Btn19 37468
#define Btn20 37469
#define Btn21 37470

#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_BtnTest"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(_curTarget getVariable ["displayModel", false]) exitWith {closeDialog 0};
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air") OR (_curTarget isKindOf "Bicycle") OR (_curTarget isKindOf "Motorbike") OR (_curTarget isKindOf "Motorcycle") OR (_curTarget isKindOf "A3L_Tahoe_Base")) then {true} else {false};
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
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;
_Btn14 = _display displayCtrl Btn14;
_Btn15 = _display displayCtrl Btn15;
_Btn16 = _display displayCtrl Btn16;
_Btn17 = _display displayCtrl Btn17;
_Btn18 = _display displayCtrl Btn18;
_Btn19 = _display displayCtrl Btn19;
_Btn20 = _display displayCtrl Btn20;
_Btn21 = _display displayCtrl Btn21;

life_vInact_curTarget = _curTarget;
life_the_driver = driver (vehicle life_vInact_curTarget);
//Set Repair Action

_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;";
if( damage _curTarget < 1 ) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};


if(playerSide == west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
	
	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";
	
	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";


			_Btn6 buttonSetAction "life_vInact_curTarget setPosASL [getPosASL life_vInact_curTarget select 0, getPosASL life_vInact_curTarget select 1, (getPosASL life_vInact_curTarget select 2) + 0.5]; closeDialog 0;";
			if(count crew _curTarget == 0) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false;};
		};
	};	

	//btn7 is called at bottom of script.
	
	_Btn7 ctrlSetText localize "STR_pInAct_TestIntox";
	_Btn7 buttonSetAction "[life_the_driver] spawn life_fnc_testIntox;";

	//Set Ticket Button
	_Btn8 ctrlSetText localize "STR_pInAct_TicketBtn";
	_Btn8 buttonSetAction "[life_the_driver] call life_fnc_ticketAction;";

	//Pullout Driver Only
	_Btn9 ctrlSetText "Pullout Driver";
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutDriverAction;";

	//Check for vehicle defects
	_Btn10 ctrlSetText "Destroy Vehicle";
	_Btn10 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_checkdefect;";


	if(!command) then {
		_Btn10 ctrlEnable false;	
	};


	_Btn11 ctrlSetText "Check Licence";
	_Btn11 buttonSetAction "[life_the_driver] spawn life_fnc_licensesLook; closeDialog 0;";


	if(isplayer life_the_driver) then {
		_Btn7 ctrlEnable true;
		_Btn8 ctrlEnable true;
		_Btn9 ctrlEnable true;
		_Btn11 ctrlEnable true;
	} else {
		_Btn7 ctrlEnable false;	
		_Btn8 ctrlEnable false;	
		_Btn9 ctrlEnable false;
		_Btn11 ctrlEnable false;	
	};



	_Btn12 ctrlSetText "Park Ticket 500";
	_Btn12 buttonSetAction "life_vInact_curTarget setVariable[""parkingTicket"",true,true]; closeDialog 0;";

	_Btn13 ctrlSetText "Park Ticket 1500";
	_Btn13 buttonSetAction "life_vInact_curTarget setVariable[""parkingTicket2"",true,true]; closeDialog 0;";

	
	if(life_vInact_curTarget getVariable ["parkingTicket", false]) then {
		_Btn12 ctrlEnable false;	
	} else {
		_Btn12 ctrlEnable true;	
	};

	if(life_vInact_curTarget getVariable ["parkingTicket2", false]) then {
		_Btn13 ctrlEnable false;	
	} else {
		_Btn13 ctrlEnable true;	
	};


		_Btn14 ctrlSetText "Push Vehicle";
		_Btn14 buttonSetAction "[1] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn15 ctrlSetText "Double Push";
		_Btn15 buttonSetAction "[2] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn16 ctrlSetText "Triple Push";
		_Btn16 buttonSetAction "[3] spawn life_fnc_pushVehicle; closeDialog 0;";

		if(!life_action_inuse) then {
			_Btn14 ctrlEnable false;
			_Btn15 ctrlEnable false;
			_Btn16 ctrlEnable false;
		};
	_Btn17 ctrlShow false;
	_Btn18 ctrlShow false;

} else {
	if(playerSide == independent) then {
		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "life_vInact_curTarget setPosASL [getPosASL life_vInact_curTarget select 0, getPosASL life_vInact_curTarget select 1, (getPosASL life_vInact_curTarget select 2) + 0.5]; closeDialog 0;";
				if(count crew _curTarget == 0) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
			};
		};
		
		_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_emspulloutAction;";
		if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};


		_Btn4 ctrlSetText localize "STR_vInAct_EMSPullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";


		_Btn5 ctrlSetText "Push Vehicle";
		_Btn5 buttonSetAction "[1] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn6 ctrlSetText "Double Push";
		_Btn6 buttonSetAction "[2] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn7 ctrlSetText "Triple Push";
		_Btn7 buttonSetAction "[3] spawn life_fnc_pushVehicle; closeDialog 0;";

		if(!life_action_inuse) then {
			_Btn5 ctrlEnable false;
			_Btn6 ctrlEnable false;
			_Btn7 ctrlEnable false;
		};
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
	_Btn11 ctrlShow false;
	_Btn12 ctrlShow false;
	_Btn13 ctrlShow false;
	_Btn14 ctrlShow false;
	_Btn15 ctrlShow false;
	_Btn16 ctrlShow false;
	_Btn17 ctrlShow false;
	_Btn18 ctrlShow false;
	}
	else {
	
		if(_curTarget isKindOf "Ship") then {
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPosATL life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget == 0 && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};				
			};
		};
		

		_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(cursorTarget in life_vehicles && {player distance cursorTarget < 5}) then { _Btn4 ctrlEnable true; } else {	_Btn4 ctrlEnable false; };

		_Btn4 ctrlSetText localize "STR_vInAct_Impound";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundActionTow; closeDialog 0;";
		if((player distance (getMarkerPos "tow_truck")) < 12) then {
			_Btn4 ctrlEnable true;
		} else {
			_Btn4 ctrlEnable false;
		};


		_Btn5 ctrlSetText "Push Vehicle";
		_Btn5 buttonSetAction "[1] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn6 ctrlSetText "Double Push";
		_Btn6 buttonSetAction "[2] spawn life_fnc_pushVehicle; closeDialog 0;";

		_Btn7 ctrlSetText "Triple Push";
		_Btn7 buttonSetAction "[3] spawn life_fnc_pushVehicle; closeDialog 0;";

		if(!life_action_inuse) then {
			_Btn5 ctrlEnable false;
			_Btn6 ctrlEnable false;
			_Btn7 ctrlEnable false;
		};

	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
	_Btn11 ctrlShow false;
	_Btn12 ctrlShow false;
	_Btn13 ctrlShow false;
	_Btn14 ctrlShow false;
	_Btn15 ctrlShow false;
	_Btn16 ctrlShow false;
	_Btn17 ctrlShow false;
	_Btn18 ctrlShow false;
	};
};



	_Btn19 ctrlShow false;
	_Btn20 ctrlShow false;
	_Btn21 ctrlShow false;