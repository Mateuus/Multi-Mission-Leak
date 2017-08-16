/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_clockInit.sqf

    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA)
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Inits the clock

    Parameters:
    None

    Returns:
    Nothing

	 YYYY  MM  DD  hh  mm
    [2015, 05, 19, 11, 49]
*/
_year = param [0,0,[0]];
_month = param [1,0,[0]];
_day = param [2,0,[0]];
_hour = param [3,0,[0]];
_minute = param [4,0,[0]];
_version = lhm_versionInfo param [0,"",[""]];

disableSerialization;
9999 cutRsc["LHM_clock","PLAIN",0.5,false];
_display = uiNamespace getVariable["LHM_clock",displayNull];
if(isNull _display) exitWith {};
_displayText = _display displayCtrl 1000;

_minuteText = str(_minute);
_hourText = str(_hour);

if(_hour < 10) then {
	_hourText = "0" + _hourText;
};
if(_minute < 10) then {
	_minuteText = "0" + _minuteText;
};

_versionText = format["<t align='left'>%1</t>",_version];
_clockText = format ["<t align='right' >%1  %2.%3.%4  %5:%6</t>",player getVariable["realname",name player], _day,_month,_year,_hourText,_minuteText];

_displayText ctrlSetStructuredText parseText (_versionText + _clockText);