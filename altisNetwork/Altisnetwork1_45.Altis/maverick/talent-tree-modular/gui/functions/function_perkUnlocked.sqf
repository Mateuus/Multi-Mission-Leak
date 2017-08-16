scriptName "function_perkUnlocked";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: function_perkUnlocked.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "function_perkUnlocked.sqf"

try {
	private _config = param [0, configNull, [configNull]];
	if (isNull _config) exitWith {};

	"TTM_GUI_RscTitlePerkUnlocked" cutRsc ["TTM_GUI_RscTitlePerkUnlocked", "PLAIN"];
	_titleDisplay = uiNamespace getVariable ["TTM_GUI_RscTitlePerkUnlocked", displayNull];
	_ctrlStrucText = _titleDisplay displayCtrl 0;
	if (isNull _titleDisplay) throw "Title display could not be found";

	private _displayName = getText (_config >> "displayName");

	_ctrlStrucText ctrlSetStructuredText parseText format ["<t size='1' align='center' shadow='2'><t color='#A2FD5A' size='2.3'>%1</t><br /><t color='#FFFFFF' size='1.5'>UNLOCKED</t></t>", _displayName];
} catch {
	[format ["[%1] %2", __filename, _exception]] call BIS_fnc_error;
};