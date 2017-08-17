/*
	File: fn_deleteLoadout.sqf
	Author: Jason_000
*/
disableSerialization;
private["_loadout","_txt"];
_txt = lbtext[4002,(lbCurSel 4002)];
Loadout = profileNamespace getVariable['Loadout',[]];

if(_txt != '') then {
	if(_txt in Loadout) then {
		_loadout = Loadout find _txt;
		//if !(_loadout == 0) exitWith { ["Error, loadout not found",false,"slow"] call life_fnc_notificationSystem; };
		_return = Loadout deleteAt _loadout;
		systemchat format['Deleted Loadout: %1',_return];
		profileNamespace setVariable['Loadout',Loadout];
		saveprofileNamespace;
		lbDelete [4002, (lbCurSel 4002)];
		//[player, [profileNamespace, _txt]] call BIS_fnc_deleteInventory; Gives errors, why?
	};
};
