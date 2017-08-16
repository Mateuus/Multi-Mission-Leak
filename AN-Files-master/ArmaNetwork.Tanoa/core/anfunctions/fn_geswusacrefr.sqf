/*

	Player clicked arrest/ok

*/

private ["_time","_arrest","_arrestOne"];
if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hintSilent localize "STR_MISC_WrongTarget"};
_time = ctrlText 1400;
if(!([_time] call life_fnc_spunetuwada)) exitWith {hintSilent localize "STR_Shop_Virt_NoNum";};
_time = parseNumber _time;
_time = round _time;
if(_time < 5 || {_time > 140}) exitWith {hintSilent "Time must be between 5 and 140 minutes!";};
_arrest = ctrlText 1500;
if(_arrest isEqualTo "") exitWith {hintSilent "You must enter something!";};
_len = [_arrest] call KRON_StrLen;
if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};
_arrestOne = toArray(_arrest);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_,- ");
_badChar = false;
{
	if (!(_x in _allowed)) exitWith {_badChar = true;};
} forEach _arrestOne;
if(_badChar) exitWith {hintSilent localize "STR_GNOTF_IncorrectChar";};
closeDialog 0;
[life_pInact_curTarget,_time,_arrest] call life_fnc_zujawraweste;
