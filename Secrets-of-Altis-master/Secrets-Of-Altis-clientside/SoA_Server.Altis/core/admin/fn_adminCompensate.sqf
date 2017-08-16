#include <macro.h>
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	
	Description:
	Figure it out.
*/
private["_value","_action","_grund"];
if(__GETC__(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-Geldcheat!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

if(__GETC__(life_adminlevel < 3)) then {
	createDialog "checkAdmin";
	WaitUntil{isnull (finddisplay 8600)};
};

_value = ctrlText 9922;
if((parseNumber(_value)) < 0) exitWith {hint "Weniger als 0...dein Ernst?"};
if(!([_value] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};

_action = [
	format [localize "STR_ANOTF_CompWarn",[(parseNumber(_value))] call life_fnc_numberText],
	localize "STR_Admin_Compensate",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_beatgeld = life_beatgeld + (parseNumber(_value));
	hint format [localize "STR_ANOTF_Success",[(parseNumber(_value))] call life_fnc_numberText];
	[[(parseNumber(_value))] call life_fnc_numberText, name player,"",1,"",admingrund] remoteExecCall ["life_fnc_logDat",2];
};