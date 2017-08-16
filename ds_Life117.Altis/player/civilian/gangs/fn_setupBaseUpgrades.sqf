/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up bus stops
*/
disableSerialization;
private["_distance","_time","_cost","_upgrades","_dialog","_vehicleListPrice","_vehicleListStr","_marker","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray","_locationsNew"];

disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_locationsNew = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_upgrades = [
["Treat Sickness (Cash)","Save yourself travelling to hospital by treating your infections from your base flag until the end of the month","0"],
["Treat Sickness (Tokens)","Save yourself travelling to hospital by treating your infections from your base flag until the end of the month","1"],
["Vehicle Rearm/Refuel/Repair (Cash)","Quickly maintain your vehicles from your base flag until the end of the month","2"],
["Vehicle Rearm/Refuel/Repair (Tokens)","Quickly maintain your vehicles from your base flag until the end of the month","3"],
["Base Markers (Cash)","View all players on your map near your base until the end of the month","4"],
["Base Markers (Tokens)","View all players on your map near your base until the end of the month","5"],
["KOS Warning (Cash)","Get informed everytime somebody attempts to capture the KOS capture point while you own it until the end of the month","6"],
["KOS Warning (Tokens)","Get informed everytime somebody attempts to capture the KOS capture point while you own it until the end of the month","7"],
["Factory (Cash)","The ability to craft items from your base flag until the end of the month","8"],
["Factory (Tokens)","The ability to craft items from your base flag until the end of the month","9"]
];

lbClear _vehicleList;

{
	_string = (_x select 0);
	_toolTip = (_x select 1);
	_vehicleList lbAdd format ["%1",_string];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,(_x select 2)];
} foreach _upgrades;

