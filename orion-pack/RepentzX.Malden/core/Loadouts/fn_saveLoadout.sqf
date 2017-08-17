/*
	File: fn_saveLoadout.sqf
	Author: Jason_000
*/
disableSerialization;
private["_txt"];
_txt = ctrlText 4006;
if(_txt == '') exitWith { ["Please enter a name!",false,"slow"] call life_fnc_notificationSystem; };

Loadout = profileNamespace getVariable['Loadout',[]];

if!(_txt in Loadout)then
{
	Loadout pushBack _txt;
	profileNamespace setVariable['Loadout',Loadout];
	saveprofileNamespace;
};
[player, [profileNamespace, _txt]] call BIS_fnc_saveInventory;

["loadout saved",false,"slow"] call life_fnc_notificationSystem;
findDisplay 4000 displayCtrl 4002 lbAdd _txt;
