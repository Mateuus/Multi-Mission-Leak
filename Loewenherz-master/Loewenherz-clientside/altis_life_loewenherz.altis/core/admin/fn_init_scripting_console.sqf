


disableSerialization;
closeDialog 0;
waitUntil {!dialog};
createDialog "BA_Scripting_console";

waitUntil {!isnull (finddisplay 3577);};
_display = finddisplay 3577;
_ansehen1 = _display displayCtrl 1100;
_ansehen2 = _display displayCtrl 1101;
_ansehen3 = _display displayCtrl 1102;
_ansehen4 = _display displayCtrl 1103;
_ansehen5 = _display displayCtrl 1104;
_ansehen6 = _display displayCtrl 1105;
_ansehen7 = _display displayCtrl 1106;
_ansehen8 = _display displayCtrl 1107;
_ansehen9 = _display displayCtrl 1108;
_ansehen10 = _display displayCtrl 1110;
_ansehen11 = _display displayCtrl 1111;

_eingabe1 = _display displayCtrl 1402;
_eingabe2 = _display displayCtrl 1403;
_eingabe3 = _display displayCtrl 1404;
_eingabe4 = _display displayCtrl 1405;
_eingabe5 = _display displayCtrl 1406;
_eingabe6 = _display displayCtrl 1407;
_eingabe7 = _display displayCtrl 1408;
_eingabe8 = _display displayCtrl 1409;
_eingabe9 = _display displayCtrl 1410;
_eingabe10 = _display displayCtrl 1411;


_local_code = _display displayCtrl 1400;
_server_code = _display displayCtrl 1401;
_other_client_code = _display displayCtrl 1414;

_BTN_local = _display displayCtrl 2400;
_BTN_Server = _display displayCtrl 2401;
_BTN_close = _display displayCtrl 2402;
_BTN_other_client = _display displayCtrl 2403;

_listbox_players = _display displayCtrl 1500;

showChat false;

_listbox_players lbADD "Alle";
_listbox_players lbSetDATA[0,"XX"];


{
	_listbox_players lbadd format["%1", name _x];
	_listbox_players lbSetData[(_foreachindex + 1),name _x];

} foreach playableUnits;


if(!isnil "BA_last_local_code") then {
	if(typename BA_last_local_code == "STRING") then {
		_local_code ctrlSetText BA_last_local_code;

	};

};

if(!isnil "BA_last_server_code") then {
	if(typename BA_last_server_code == "STRING") then {
		_server_code ctrlSetText BA_last_server_code;

	};

};

if(!isnil "BA_last_other_client_code") then {
	if(typename BA_last_other_client_code == "STRING") then {
		_other_client_code ctrlSetText BA_last_other_client_code;

	};

};



_BTN_local buttonSetAction "[1] call lhm_fnc_execute_code;";
_BTN_Server buttonSetAction "[2] call lhm_fnc_execute_code;";
_BTN_other_client buttonSetAction "[3] call lhm_fnc_execute_code;";
_BTN_close buttonSetAction "
BA_last_local_code = ctrltext 1400;
BA_last_server_code = ctrltext 1401;
BA_last_other_client_code = ctrltext 1414;
closeDialog 0;
";

[] spawn lhm_fnc_update_dialog;

waitUntil {isnull (finddisplay 3577)};

showChat true;