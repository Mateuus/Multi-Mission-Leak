#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initiates the wire-transfer
*/
disableSerialization;
_target = _this select 0;
if(isNil "_target") exitWith {};
if(!alive player || dialog || !alive _target) exitWith {};
createDialog "life_jail_send";
_display = findDisplay 61301;
_titleCtrl = _display displayCtrl 3001;
life_sendToJail = false;
//_id = _target getVariable ["user_id"];
//_title = format ["Wyslij do wiezienia: %1", _id];
//_titleCtrl ctrlSetText _title;

_timeCtrl = _display displayCtrl 3004;
_reasonCtrl = _display displayCtrl 3005;

waitUntil {life_sendToJail || !dialog};
if(life_sendToJail) then {
	_time = floor(parseNumber(ctrlText 3004));
	if(_time <= 0) exitWith {};
	_reason = ctrlText 3005;
	[_target, _time, _reason] call life_fnc_arrestAction;
	life_sendToJail = false;
	closeDialog 0;
};