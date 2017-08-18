/*
	file: fn_showArrestDialog.sqf
	Shows cop arrest dialog

*/

if(playerSide != west) exitWith {};

createDialog "jail_time";