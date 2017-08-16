/*
	Description:
	The highest ranking cop online at the time can request funds to deal with hostages being taken
*/
#include "..\..\script_macros.hpp"
private["_value","_action","_otherLevels","_myLevel"];
_myLevel = (FETCH_CONST(life_coplevel));
_otherLevels = [];

//Get everyones police ranks
{
	if (playerSide != west) exitWith {};
	_thisLevel = (FETCH_CONST(life_coplevel));
	_otherLevels pushBack _thisLevel;

} forEach allUnits;

//Check if your rank is higher
{
	if (_myLevel < _x) exitWith {"Only the highest ranking officer can request emergency funds!"};
} forEach _otherLevels;

_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 999999) exitWith {hint localize "STR_ANOTF_Fail"};
//if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};

_action = [
	format [localize "Request Funds",[_value] call life_fnc_numberText],
	"You are requesting money to deal with a hostage or any other emergency situation that may arise. This request will be logged and any abuse will result in your immediate removal from the police force.",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_cash = life_cash + _value;
	hint format [localize "STR_ANOTF_Success",[_value] call life_fnc_numberText];
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};