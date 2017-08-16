#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_Company.sqf

Description:
extDB database stuff
*/
["RPP_DB_fetchCompanyList", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = "SELECT * FROM Companys";

	_curTime = diag_tickTime;
	_result = [_query,2,true] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Companys Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if (count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_CompanySystem_Empty",_ownerID];
	};

	_result remoteExec ["RPP_CompanySystem_loadList",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchCompanyList";

["RPP_DB_fetchCompany", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT Settings, Workers, Storage, Applications, CompanyBank, CompanyName FROM Companys WHERE pid='%1'", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Companys Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

	_new = [(_result select 1)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[1,_new];

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	_new = [(_result select 3)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[3,_new];

	_tmp = _result select 4;
	_result set[4,[_tmp] call RPP_safeNumber];

	_tmp = _result select 5;
	_result set[5,[_tmp] call RPP_safeString];

	_result remoteExec ["RPP_CompanySystem_load",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchCompany";

["RPP_DB_fetchCompanyApp", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_companyName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid, CompanyName, Applications FROM Companys WHERE CompanyName='%1'", _companyName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Company Applications -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_tmp = _result select 1;
	_result set[1,[_tmp] call RPP_safeString];

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	_result remoteExec ["RPP_CompanySystemApp_load",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchCompanyApp";

["RPP_insertCompany", {
  	_pid = param [0,"",[""]];
  	_ownerID = param [1,ObjNull,[ObjNull]];
  	_NameOwner = param [2,"",[""]];
  	_CName = param [3,"",[""]];
  	_Type = param [4,"",[""]];
  	_MaxWorkers = param [5,10,[""]];
  	_Workers = param [6,1,[""]];
  	_Description = param [7,"",[""]];
  	_Settings = _this select 8;
  	_Worker = _this select 9;
  	_Array = [];
  	_bank = 5000;
  	_Settings = [_Settings] call RPP_ArrToSQL;
  	_Worker = [_Worker] call RPP_ArrToSQL;
  	_Array = [_Array] call RPP_ArrToSQL;
  	_bank = [_bank] call RPP_safeNumber;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

 	_query = format["INSERT INTO Companys(pid, Name, CompanyName, Settings, Workers, Storage, Applications, CompanyBank, Type, MaxWorkers, WorkerSlots, Description) 

 	VALUES ('%1', '%2', '%3', '%4', '%5', '%10', '%10', '%11', '%6', '%7', '%8', '%9')

 	", 
 	_pid,_NameOwner,_CName,_Settings,_Worker,_Type,_MaxWorkers,_Workers,_Description,_Array,_bank
 	];

 	diag_log "------------- Fetch Companys Instert -------------";
	diag_log format["QUERY: %1",_query];
	diag_log "------------------------------------------------";

  	if(_query == "") exitWith {};

  	[_query,1] call RPP_DB_ASYNC;

  	[] remoteExec ["RPP_CompanySystem_created",_ownerID];
}] call RPP_Function;
publicVariable "RPP_insertCompany";


["RPP_DB_fetchDeleteinfo", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_companyName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT CompanyName, pid, Workers FROM Companys WHERE CompanyName='%1'", _companyName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Companys delete -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_tmp = _result select 1;
	_result set[1,[_tmp] call RPP_safeString];

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	_result remoteExec ["RPP_CompanySystem_Deleteload",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchDeleteinfo";

["RPP_DB_fetchCompanyApplications", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	_companyName = _this select 2;
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT Applications FROM Companys WHERE CompanyName='%1'", _companyName];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Companys apps -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

	_result remoteExec ["RPP_CompanySystem_appload",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchCompanyApplications";

["RPP_DB_partialSyncCompany", {
	private ["_query","_mode", "_value1", "_value2", "_data"];
	params ["_mode", "_data", "_pid"];

	switch (_mode) do {
		case 0: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Companys SET CompanyBank='%1' WHERE pid='%2'", _data, _pid];
		};
		case 1: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Companys SET MaxWorkers='%1' WHERE pid='%2'", _data, _pid];
		};
		case 2: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Companys SET WorkerSlots='%1' WHERE pid='%2'", _data, _pid];
		};
		case 3: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Companys SET Storage='%1' WHERE pid='%2'", _data, _pid];
		};
		case 4: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Companys SET Settings='%1' WHERE pid='%2'", _data, _pid];
		};
		case 5: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Companys SET Applications='%1' WHERE CompanyName='%2'", _data, _pid];
		};
		case 6: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Companys SET Workers='%1' WHERE pid='%2'", _data, _pid];
		};
		case 7: {
			_query = format["DELETE FROM Companys WHERE CompanyName='%1'",_pid];
		};
	};

	if(_query == "") exitWith {};

	[_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_partialSyncCompany";
