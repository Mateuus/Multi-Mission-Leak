#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_Police.sqf

Description:
extDB database stuff
*/
["RPP_DB_insertCrime", {
  params ["_pid", "_Name", "_reason", "_Submitby", "_race", "_uid"];
	_Name = [_Name] call RPP_safeString;
	_Submitby = [_Submitby] call RPP_safeString;
	_reason = [_reason] call RPP_ArrToSQL;
	_race = [_race] call RPP_safeString;

	_query = format["SELECT pid, Name, Submitby, UID, Crime_Records, Race FROM PoliceDB WHERE pid='%1'", _pid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch PoliceDB Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {
		_query = format["INSERT INTO PoliceDB(pid, Name, Submitby, UID, Crime_Records, Race) VALUES ('%3', '%1', '%2', '%4', '%5', '%6')", _name, _Submitby, _pid, _uid, _reason, _race];
		diag_log format["INSERT QUERY: %1",_query];
		[_query,1] call RPP_DB_ASYNC;
	};

  	if(_query == "") exitWith {
  		diag_log "EMPTY QUERY";
  	};

  	_result = [_query,2] call RPP_DB_ASYNC;
  	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

  	_new = [(_reason)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[5,_new];

  	[0, [_result], _pid] remoteExec ["RPP_DB_partialSync_Crime", 2];
  	diag_log "UPDATED CRIME.";
}] call RPP_Function;
publicVariable "RPP_DB_insertCrime";

["RPP_DB_LoadCrime_Info", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT Name FROM PoliceDB", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch PoliceDB Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";


	_tmp = _result select 1;
	_result set[1];

	[_result] remoteExec ["RPP_loadPlayer_CrimePlayers",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_LoadCrime_Info";

["RPP_loadPlayer_CrimePlayers", {
	session_finished = false;

	lbClear 1500;

	_name = _this select 0;

	{
		_uid = "";
		_getname = _x;
		_data = lbAdd[1500,format["%1",_x]];

		{
			if (name _x == _getname) exitWith {
				_uid = getPlayerUID _x;
			};
		} count playableUnits;

		lbSetData [1500, _data, _uid];
	} foreach _name;
}] call RPP_Function;
publicVariable "RPP_loadPlayer_CrimePlayers";

["RPP_DB_LoadCrime_View", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp"];
	_ownerID = param [0,ObjNull,[ObjNull]];
	_pid = param [1,"",[""]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid, Name, Submitby, UID, Crime_Records, Race FROM PoliceDB WHERE pid = '%1'", _pid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch PoliceDB Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";


	_tmp = _result select 1;
	_result set[1];
	_tmp = _result select 2;
	_result set[2];
	_tmp = _result select 3;
	_result set[3,[_tmp] call RPP_safeNumber];
	_tmp = _result select 5;
	_result set[5];

	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

	_result remoteExec ["RPP_loadPlayer_Crime",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_LoadCrime_Info";

["RPP_loadPlayer_Crime", {
	session_finished = false;

	lbClear 1501;

	_name = _this select 1;
	_Submitby = _this select 2;
	_uid = _this select 3;
	_Crimes = _this select 4;
	_race = _this select 5;

	lbAdd [1501, format ["Name: %1",_name]];
	lbAdd [1501, format ["Submitby: %1",_Submitby]];
	lbAdd [1501, format ["UID: %1",_uid]];

	lbAdd [1501, ""];
	lbAdd [1501, "== Crime Records =="];
	{
		_data = lbAdd[1501,format["%1",_x select 0]];
		lbSetData [1501, _data, _x select 0];
	} foreach _Crimes;
	lbAdd [1501, ""];

	lbAdd [1501, format ["Race: %1",_race]];
}] call RPP_Function;
publicVariable "RPP_loadPlayer_Crime";

["RPP_DB_CrimeRevoke", {
	params ["_Crime","_pid"];
	_query = format["SELECT pid, Name, Submitby, UID, Crime_Records, Race FROM PoliceDB WHERE pid = '%1'", _pid];

	_result = [_query,2] call RPP_DB_ASYNC;

	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

	[1,[_result,_Crime],_pid] remoteExec ["RPP_DB_partialSync_Crime",2];
}] call RPP_Function;
publicVariable "RPP_DB_CrimeRevoke";

["RPP_DB_partialSync_Crime", {
	private ["_query","_mode", "_value1", "_value2", "_data"];
	params ["_mode", "_data", "_pid"];

	switch (_mode) do {
		case 0: { //Update crimes
			_data1 = _data select 0;
			_current = _data1 select 4;
			_get = _data1 select 5;
			_current = _current + _get;
			_add = [_current] call RPP_ArrToSQL;
			_query = format["UPDATE PoliceDB SET Crime_Records='%1' WHERE pid='%2'", _add, _pid];
			diag_log format ["QUERY: %1",_query];
		};

		case 1: { //Revoke crimes
			_data1 = _data select 0;
			_current = _data1 select 4;
			_remove = _data select 1;
			_current = _current - [[_remove]];
			_add = [_current] call RPP_ArrToSQL;
			_query = format["UPDATE PoliceDB SET Crime_Records='%1' WHERE pid='%2'", _add, _pid];
			diag_log format ["QUERY: %1",_query];
		};
	};

	if(_query == "") exitWith {};

	[_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_partialSync_Crime";
