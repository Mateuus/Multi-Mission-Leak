/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up clan base upgrades
*/

private ["_dialog","_list","_upgrades"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_upgrades = [
	["Treat Sickness (Gang Account)","Save yourself travelling to hospital by treating your infections from your base flag until the end of the month","0"],
	["Vehicle Rearm/Refuel/Repair (Gang Account)","Quickly maintain your vehicles from your base flag until the end of the month","2"],
	["Base Markers (Gang Account)","View all players on your map near your base until the end of the month","4"],
	["KOS Warning (Gang Account)","Get informed everytime somebody attempts to capture the KOS capture point while you own it until the end of the month","6"],
	["Factory (Gang Account)","The ability to craft items from your base flag until the end of the month","8"],
	["Special Items (Gang Account)","The ability to purchase a new vest, all attachments, all facegear, and licenses from your clan flag","10"],
	["Clan Storage (Gang Account)","The the ability to store weapons and items at your gang flag, available to all clan members and saving through restarts","12"]
];

lbClear _list;

{
	_string = (_x select 0);
	_toolTip = (_x select 1);
	_list lbAdd format ["%1",_string];
	_list lbSetTooltip [(lbSize _list)-1, _toolTip];
	_list lbSetData [(lbSize _list)-1,(_x select 2)];
} foreach _upgrades;