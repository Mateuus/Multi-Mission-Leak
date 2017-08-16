/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991

	Description:
	Spectate the chosen player.
*/
if((call life_adminlevel) < 2) exitWith {call life_fnc_brefr;};
private["_unit"];

if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a Player!";};
disableSerialization;
_unit = lbData[1500,lbCurSel (1500)];
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {hintSilent localize "STR_ANOTF_Error";};
call life_fnc_brefr;
_unit switchCamera "INTERNAL";
hintSilent format["You are now spectating %1 \n\n Press F10 to stop Spectating.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'You have stopped spectating';};false"];
