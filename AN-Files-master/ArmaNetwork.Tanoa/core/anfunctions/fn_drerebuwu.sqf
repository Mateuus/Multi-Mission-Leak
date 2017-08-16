/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_mode = param [0,0,[0]];
disableSerialization;
_display = findDisplay 2700;
_type = "";
switch(_mode) do {
  //Personal
  case 0: {
    ((findDisplay 2700) displayCtrl 1100) ctrlSetStructuredText parseText format ["Cash on Hand: $%1<br/>Bank Balance: $%2",[an_cash] call life_fnc_rupadudejat,[an_bank] call life_fnc_rupadudejat];
    ((findDisplay 2700) displayCtrl 1001) ctrlSetText "Personal Account";
    ctrlEnable[2400,false];
    ctrlEnable[2401,true];
    if(isNil {(group player getVariable "gangBank")}) then {
    	ctrlEnable[2401,false];
    };
    if(!life_isGov) then {
    	ctrlEnable[2402,false];
    };
    if(isNil "ATMSearch") then {ATMSearch = [];};
    ctrlShow [1004,true];
    ctrlShow [1500,true];
    ctrlShow [1400,true];
    ctrlShow [1002,true];

    //
    ctrlShow [2404,true];//deposit
    ctrlShow [2403,true];//wihdraw
    ctrlShow [2407,true];//transfer

    ctrlShow [2408,false];//gangdeposot
    ctrlShow [2409,false];//gangwithdraw
    ctrlShow [2410,false];//govwithdraw

    lbClear 1500;
    {
    	_name = _x getVariable ["realname",name _x];
    	if(alive _x && {!(_name isEqualTo profileName)}) then {
    		switch (side _x) do {
    			case west: {_type = "TSO"};
    			case civilian: {_type = "Civ"};
    			case independent: {_type = "EMS"};
    		};
    		lbAdd [1500,format["%1 (%2)",_x getVariable ["realname",name _x],_type]];
    		lbSetData [1500,(lbSize 1500)-1,str(_x)];
        ATMSearch pushBack [_x getVariable ["realname",name _x],_type,str(_x)];
    	};
    } forEach playableUnits;
    ctrlSetText [1401,"0"];
  };
  case 1: {
    if((group player getVariable ["gbank_in_use_by",""]) != getPlayerUID player) then {
      _usedBy = (group player getVariable ["gbank_in_use_by",""]);
      if(_usedBy != "") then {
        _ready = {getPlayerUID _x isEqualTo _usedBy} count playableUnits;
        if(_ready > 0) exitWith {hintSilent "Gang Funds are currently being used!";};
      } else {
        group player getVariable ["gbank_in_use_by",""];
      };
    };
    group player setVariable["gbank_in_use_by",(getPlayerUID player),true];
    ATMSearch = nil;
    ((findDisplay 2700) displayCtrl 1100) ctrlSetStructuredText parseText format ["Gang Funds: $%1<br/>Bank Balance: $%2",[((group player) getVariable "gangBank")] call life_fnc_rupadudejat,[an_bank] call life_fnc_rupadudejat];
    ((findDisplay 2700) displayCtrl 1001) ctrlSetText format ["Gang Funds - %1",(group player) getVariable ["gangName","Error: No Name"]];
    ctrlEnable [2401,false];
    ctrlEnable[2400,true];
    ctrlShow [1004,false];
    ctrlShow [1500,false];
    ctrlShow [1400,false];
    ctrlShow [1002,false];
    if(!life_isGov) then {
    	ctrlEnable[2402,false];
    };
    ctrlShow [2404,false];//deposit
    ctrlShow [2403,false];//wihdraw
    ctrlShow [2407,false];//transfer

    ctrlShow [2408,true];//gangdeposot
    ctrlShow [2409,true];//gangwithdraw
    ctrlShow [2410,false];//govwithdraw
    ctrlSetText [1401,"0"];
  };
  case 2: {
    if(!life_isGov) exitWith {};
    life_govCash = -1;
    ATMSearch = nil;
    [player,0] remoteExecCall ["life_fnc_getGovDetails",2];
    ((findDisplay 2700) displayCtrl 1001) ctrlSetText format ["Government Funds"];
    ctrlEnable[2400,true];
    ctrlEnable[2402,false];
    ctrlShow [1004,false];
    ctrlShow [1500,false];
    ctrlShow [1400,false];
    ctrlShow [1002,false];
    ((findDisplay 2700) displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1.25'>Retrieving Info...</t>"];
    if(isNil {(group player getVariable "gangBank")}) then {
      ctrlEnable[2401,false];
    };
    ctrlShow [2404,false];//deposit
    ctrlShow [2403,false];//wihdraw
    ctrlShow [2407,false];//transfer
    ctrlShow [2408,false];//gangdeposot
    ctrlShow [2409,false];//gangwithdraw
    ctrlEnable [2410,false];//gov withdraw
    ctrlSetText [1401,"0"];
    waitUntil {life_govCash != -1};
    ctrlEnable [2410,true];
    ((findDisplay 2700) displayCtrl 1100) ctrlSetStructuredText parseText format["Government Funds: $%1",[life_govCash] call life_fnc_rupadudejat];
  };
};
