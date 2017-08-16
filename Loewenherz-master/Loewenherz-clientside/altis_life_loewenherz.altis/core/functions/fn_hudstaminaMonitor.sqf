/*
    Author: H4SHK3KS (ofpectag: PoA)
    File: fn_hudstaminaMonitor.sqf


    Written for Pirates of Altis
    http://pirates-of-altis.de/
    The usage of this file is restricted to allowed servers (e.g. PoA).
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!

    Description:
    Monitors the stamina and changes the progress bar in the hud

    Parameters:
    None

    Returns:
    Nothing
*/
if(!(profileNamespace getVariable["lhm_enableHudStamina",true])) exitWith {};
disableSerialization;
_hud = uiNamespace getVariable["playerHUD",displayNull];
_fatigueHud = _hud displayCtrl 5108;
_fatigueHud progressSetPosition (1 - (getFatigue player) * 2);
waitUntil {
	_fatigue = getFatigue player;
	waitUntil {sleep 0.7; _fatigue != getFatigue player || !alive player};
	_fatigueHud progressSetPosition (1 - (getFatigue player) * 2);
	!alive player;
};