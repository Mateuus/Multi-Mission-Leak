/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Syncs a player's data or everyone's on the server
*/

private ["_unit"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

params [["_syncAll",false,[false]]];

if(_syncAll)then {
	_action = [
		"Are you sure you want to sync the data of all players? This should be used with care.",
		"Sync All",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};

	hint "Syncing data of all players - Wait 30s before closing the server or logging out";
	[] remoteExec ["DS_fnc_adminMassSync",-2];
	[] remoteExec ["DB_fnc_syncAllData",2];
} else {
	if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
	_unit = lbData [1500,lbCurSel 1500];
	_unit = missionNamespace getVariable _unit;
	if((isNil "_unit")||(isNull _unit))exitWith{};

	hint format ["Syncing %1's data",name _unit];
	[] remoteExec ["DS_fnc_adminMassSync",_unit];
};