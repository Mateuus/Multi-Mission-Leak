/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_hudSettings.sqf


    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA).
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Called when settings are changed

    Parameters:
    None

    Returns:
    Nothing
*/
private ["_display","_settings","_control"];
disableSerialization;
_display = uiNamespace getVariable["playerHUD",displayNull];
if(isNull _display) exitWith {};

_settings = [
	["lhm_enableHudWeight",5106,5107],
	["lhm_enableHudEXP",5110,5111],
	["lhm_enableHudStamina",5108,5109]
];

{
	if(profileNamespace getVariable[(_x select 0),true]) then {
		_control = _display displayCtrl (_x select 1);
		_control ctrlShow true;
		_control = _display displayCtrl (_x select 2);
		_control ctrlShow true;
	} else {
        _control = _display displayCtrl (_x select 1);
        _control ctrlShow false;
        _control = _display displayCtrl (_x select 2);
        _control ctrlShow false;
    };
} forEach _settings;
if(!isNull lhm_fnc_hudstaminaMonitor) then {
    lhm_fnc_hudstaminaMonitor = [] spawn lhm_fnc_hudstaminaMonitor;
};

// Disable EXP for not civs
//if(playerSide != civilian) then {
    _control = _display displayCtrl 5110;
    _control ctrlShow false;
    _control = _display displayCtrl 5111;
    _control ctrlShow false;
//};