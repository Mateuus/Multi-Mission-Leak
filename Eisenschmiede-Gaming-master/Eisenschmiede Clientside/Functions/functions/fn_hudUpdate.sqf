/*
	File: fn_hudUpdate.sqf
	Author: Dillon "Itsyuka" Modine-Thuen

	Description:
	Updates the HUD when it needs to.
*/
private["_hud"];

disableSerialization;

_hud = uiNamespace getVariable ["playerHUD", displayNull];

if(isNull (uiNamespace getVariable ["playerHUD",displayNull])) then {[] call ES_fnc_hudSetup;};
(_hud displayCtrl 2200) progressSetPosition (1 / (100 / ES_hunger));
(_hud displayCtrl 2201) progressSetPosition (1 / (100 / ES_thirst));
(_hud displayCtrl 2202) progressSetPosition (1 - (damage player));
(_hud displayCtrl 2203) progressSetPosition ([] call ES_fnc_xp_getProgress);

(_hud displayCtrl 1000) ctrlsetText format["%1", ES_hunger];
(_hud displayCtrl 1001) ctrlsetText format["%1", ES_thirst];
(_hud displayCtrl 1002) ctrlsetText format["%1", round((1 - (damage player)) * 100)];
(_hud displayCtrl 1003) ctrlsetText format["%1", ES_xp_lvl];

[] call ES_fnc_lvl_xpInfo;