/*
	File: fn_slotmachine.sqf
	Author: Jacob "PapaBear" Tyler
	Description: intializes the slotmachine gui
*/

createDialog "SlotMachineGUI";
disableSerialization;

waitUntil{!isNull(findDisplay 5780)};
waitUntil{isNull(findDisplay 5780)};
[6] call SOCK_fnc_updatePartial;