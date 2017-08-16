/*
	File: fn_way_one_1.sqf
	Author: Baney

	Description:
	Keine Zeit für Beschreibung, Star Trek gucken


	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/







private ["_display","_auslastung_header","_hacking_status","_display_happening","_On_OFF_BTN","_Close_BTN","_terminal","_terminal_chosen","_temp","_temp1"];
disableSerialization;
closeDialog 0;

createDialog "LHM_BANK_STATUS";

_display = findDisplay 1337;
_auslastung_header = _display displayCtrl 1000;
_hacking_status = _display displayCtrl 1001;
_display_happening = _display displayCtrl 1002;
_On_OFF_BTN = _display displayCtrl 1003;
_Close_BTN = _display displayCtrl 1004;



_Close_BTN ctrlSetTextColor [1,0,0,1];
_Close_BTN ctrlSetText "Close";
_Close_BTN buttonSetAction "CloseDialog 0;";


_On_OFF_BTN ctrlSetTextColor [0,0,1,1];
_On_OFF_BTN ctrlSetText "ON";
_On_OFF_BTN buttonSetAction "
	[] spawn {
		private [""_terminal"",""_terminal_chosen"",""_temp"",""_distance"",""_pos"",""_marker_found""];
		_terminal = nearestObjects[player,[""Land_DataTerminal_01_F""],30];
		if(count(_terminal) == 0) exitWith {hint ""Fehler: Kein Terminal in der Nähe""};
		_terminal_chosen = _terminal select 0;
		_temp = Gericht_1 getvariable[""HACK_STATUS"",[]];
		_temp pushback true;
		 Gericht_1 setVariable[""HACK_STATUS"",_temp,true];
		 closeDialog 0;
		 playsound ""isready"";
		 [_terminal_chosen,1] call BIS_fnc_dataTerminalAnimate;
		 sleep 5;
		deleteVehicle _terminal_chosen;
		_distance = 400000;
		{
			_pos = getmarkerpos _x;
			if((player distance _pos) < _distance) then {
				_distance = player distance _pos;
				_marker_found = _x;
			};


		} foreach [""Bank_Way_1_1"",""Bank_Way_1_2"",""Bank_Way_1_3""];
};
";

_temp1 = Gericht_1 getvariable["HACK_STATUS",[]];

_auslastung_header ctrlsettext "Server Status";
switch(count(_temp1)) do {
	case 0: {_display_happening ctrlSetStructuredText parsetext format["Server Status:<br/>Normal"];};
	case 1: {_display_happening ctrlSetStructuredText parsetext format["Server Status:<br/>Stabil"];};
	case 2: {_display_happening ctrlSetStructuredText parsetext format["Server Status:<br/>Kritisch"];};
	case 3: {_display_happening ctrlSetStructuredText parsetext format["Server Status:<br/>DOWN"];};
	default {_display_happening ctrlSetStructuredText parsetext format["Server Status:<br/>Unklar"];};
};


switch(count(_temp1)) do {
	case 0: {_hacking_status ctrlSetStructuredText parsetext format["0/<br/>605225MB"];};
	case 1: {_hacking_status ctrlSetStructuredText parsetext format["201741/<br/>605225MB"];};
	case 2: {_hacking_status ctrlSetStructuredText parsetext format["403483/<br/>605225MB"];};
	case 3: {_hacking_status ctrlSetStructuredText parsetext format["605225/<br/>605225MB"];};
	default {_hacking_status ctrlSetStructuredText parsetext format["X/<br/>605225MB"];};
};

