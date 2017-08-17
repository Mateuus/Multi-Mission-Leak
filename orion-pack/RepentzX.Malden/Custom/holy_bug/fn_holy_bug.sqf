/*
 *
 *	@File:		holy_bugtracker.sqf
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 */
disableSerialization;
_uid = getPlayerUID player;
_name = profileName;
_dialog = findDisplay 1349;
_pnbox = _dialog displayCtrl 1351;
_puidbox = _dialog displayCtrl 1350;
_hinweis1 = _dialog displayCtrl 1354;
_hinweis2 = _dialog displayCtrl 1355;
_auswahl = (_this select 0);

if(!dialog) then {createDialog "holy_bug"}; //Thefuck?
waitUntil {!isNull (_dialog)};

switch(_auswahl) do {
	case 0: {
		hint parseText format["<t underline='true'>Abuse</t> leads to Ban!"];
		_pnbox ctrlSetStructuredText parseText format["%1",_name];
		_puidbox ctrlSetStructuredText parseText format["%1",_uid];
		_hinweis1 ctrlSetStructuredText parseText format["<t align='center'><t color='#ff0000'>*</t> Fields marked with this symbol</t>"];
		_hinweis2 ctrlSetStructuredText parseText format["<t align='center'><t underline='true'>have to</t> fill out!</t>"];
	};
	case 1: {
		if(((ctrlText 1352) != "") && ((ctrlText 1353) != "")) then {
			if(((ctrlText 1352) != "Please enter title") && ((ctrlText 1353) != "Please enter a description")) then {
				[format["%1 (%2) Has just found a bug: ['TITLE: %3'], ['DESCRIPTION: %4']", _name,_uid,ctrlText 1352,ctrlText 1353], "bugReport"] remoteExecCall ["A3Log", 2];
				
				["Bug has been reported successfully!",false,"slow"] call life_fnc_notificationSystem;
				closeDialog 0;
			} else {["You have to fill each field!",false,"slow"] call life_fnc_notificationSystem;};
		} else {["You have to fill each field!",false,"slow"] call life_fnc_notificationSystem;};
	};
};
