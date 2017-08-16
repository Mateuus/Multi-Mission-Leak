scriptName "fn_updateDatabaseEntry";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_updateDatabaseEntry.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_updateDatabaseEntry.sqf"

scopeName "main";

diag_log "fn_updateDatabaseEntry.sqf 1";

params [
	["_which", -1, [0]],
	["_toUpdate", [], [0, []]],
	["_pid", "", [""]]
];

diag_log "fn_updateDatabaseEntry.sqf 2";

if (_toUpdate isEqualTo [] || {_pid isEqualTo ""} || {_which isEqualTo -1}) exitWith {};

diag_log "fn_updateDatabaseEntry.sqf 3";

private _query = "";
switch (_which) do {

	case 0: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_level = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 1: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_total = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 2: {
		if (_toUpdate isEqualType []) then {breakOut "main"};
		_query = format ["UPDATE players SET exp_perkPoints = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};

	case 3: {
		if (_toUpdate isEqualType 0) then {breakOut "main"};
		_toUpdate call mav_ttm_fnc_tinyIntConverter;
		_query = format ["UPDATE players SET exp_perks = '%1' WHERE pid = '%2'", _toUpdate, _pid];
	};
};

if (_query isEqualTo "") exitWith {};

[_query, 1] call DB_fnc_asyncCall;