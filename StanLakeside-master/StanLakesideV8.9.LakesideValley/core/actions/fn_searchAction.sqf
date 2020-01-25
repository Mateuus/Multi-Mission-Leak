/*
	File: fn_searchAction.sqf
	
	
	Description:
	Starts the searching process.
*/

params [["_unit", objNull, [objNull]]];
if(isNull _unit) exitWith { ["Nie wyglada na to zebys kogos mogl przeszukac..", false] spawn domsg; };

remoteExec ["fnc_searched",_unit];