#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_Gang.sqf

Description:
extDB database stuff
*/
["RPP_DB_fetchGang", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = "SELECT * FROM Gangs";

	_curTime = diag_tickTime;
	_result = [_query,2,true] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang Request LIST -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};

	_result remoteExec ["RPP_Gang_Load",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGang";

["RPP_DB_fetchGangJoin", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_GangName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT GangName, GangMembersUID, Locked, pid, GangMembersname FROM Gangs WHERE GangName='%1'", _GangName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang Join Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};

	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_new = [(_result select 1)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[1,_new];

	_tmp = _result select 2;
	_result set[2];

	_tmp = _result select 3;
	_result set[3,[_tmp] call RPP_safeString];

	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

	_result remoteExec ["RPP_Gang_JoinLoad",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGangJoin";

["RPP_DB_fetchGanglock", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_GangName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid,Locked FROM Gangs WHERE GangName='%1'", _GangName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang lock -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};

	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];
	_tmp = _result select 1;
	_result set[1];

	_result remoteExec ["RPP_Gang_LockAccess",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGanglock";

["RPP_DB_fetchGangLeave", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_GangName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT GangMembersUID, GangMembersname FROM Gangs WHERE GangName='%1'", _GangName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang Manage -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};


	_new = [(_result select 9)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[9,_new];

	_new = [(_result select 1)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[1,_new];

	_result remoteExec ["RPP_Gang_leavestats",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGangLeave";

["RPP_DB_fetchGangManage", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_GangName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid,Gangleader,GangName,GangMembersUID,GangMembersname,Locked FROM Gangs WHERE GangName='%1'", _GangName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang Manage -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};

	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_tmp = _result select 1;
	_result set[1,[_tmp] call RPP_safeString];

	_tmp = _result select 2;
	_result set[2,[_tmp] call RPP_safeString];

	_new = [(_result select 3)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[3,_new];

	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

	_tmp = _result select 5;
	_result set[5];

	_result remoteExec ["RPP_Gang_ManageGang",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGangManage";


["RPP_DB_fetchGangAreaCapture", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_GangName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid, GangName, GangMembersUID FROM Gangs WHERE GangName='%1'", _GangName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Gang Capture Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Gang_Empty",_ownerID];
	};


	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_tmp = _result select 1;
	_result set[1,[_tmp] call RPP_safeString];

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	_result remoteExec ["RPP_Gang_Capture",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchGangAreaCapture";

["RPP_DB_insertGang", {
	private["_queryResult", "_query", "_tickTime"];
	params [
		"_uid",
		"_player",
		"_gangname",
		"_ganguidarray",
		"_gangnameArray"
	];
	
	if(_uid == "") exitWith {diag_log "Bad UID or name";};

	_query = format["SELECT pid, GangName, GangMembersUID FROM Gangs WHERE GangName='%1'",_gangname];

	_tickTime = diag_tickTime;
	_queryResult = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Check Before Insert Gang -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";

	diag_log "INSERT GO";

	if(!(count _queryResult isEqualTo 0)) exitWith {
		diag_log "queryResult = 1";
		[] remoteExec ["RPP_Gang_AlreadyOwning",_player];
	};

	_ganguidarray = [_ganguidarray] call RPP_ArrToSQL;
	_gangnameArray = [_gangnameArray] call RPP_ArrToSQL;
	_gangname = [_gangname] call RPP_safeString;

	
	_query = format["INSERT INTO Gangs (pid, Gangleader, GangName, GangMembersUID, GangMembersname) VALUES('%1', '%1', '%2', '%3', '%4')", _uid, _gangname, _ganguidarray, _gangnameArray];

	[_query,1] call RPP_DB_ASYNC;

	diag_log format ["INSERT GANG: %1",_query];

	[] remoteExec ["RPP_Gang_Created",_player];
}] call RPP_Function;
publicVariable "RPP_DB_insertGang";

["RPP_DB_partialSyncGang", {
	private ["_query","_mode", "_value1", "_value2", "_data"];
	params ["_mode", "_data", "_pid"];
	diag_log format ["%1 | %2 | %3",_mode,_data,_pid];
	switch (_mode) do {
		case 0: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Gangs SET GangMembersUID='%1' WHERE GangName='%2'", _data, _pid];
		};
		case 1: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Gangs SET GangMembersname='%1' WHERE GangName='%2'", _data, _pid];
		};
		case 2: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Gangs SET Locked='%1' WHERE GangName='%2'", _data, _pid];
		};
		case 3: {
			_query = format["DELETE FROM Gangs WHERE GangName='%1'",_pid];
		};
	};

	if(_query == "") exitWith {};

	[_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_partialSyncGang";
