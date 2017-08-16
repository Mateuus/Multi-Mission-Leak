#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB.sqf

Description:
extDB database stuff
*/
["RPP_DB_ASYNC", {
	private["_queryStmt","_mode","_multiarr","_queryResult","_key","_return","_loop"];
	_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
	_mode = [_this,1,1,[0]] call BIS_fnc_param;
	_multiarr = [_this,2,false,[false]] call BIS_fnc_param;

	_key = EXTDB format["%1:%2:%3",_mode,FETCH_CONST(RPP_SQL_ID),_queryStmt];

	if(EQUAL(_mode,1)) exitWith {true};

	_key = call compile format["%1",_key];
	_key = SEL(_key,1);

	_queryResult = "";
	_loop = true;
	while{_loop} do {
		_queryResult = "extDB2" callExtension format["4:%1", _key];
		if (EQUAL(_queryResult,"[5]")) then {
			_queryResult = "";
			for "_i" from 0 to 1 step 0 do {
				_pipe = EXTDB format["5:%1", _key];
				if(_pipe == "") exitWith {_loop = false};
				_queryResult = _queryResult + _pipe;
			};
		} else {
			if (!(EQUAL(_queryResult,"[3]"))) then {
				_loop = false;
			};
		};
	};
	_queryResult = call compile _queryResult;
	if(EQUAL(SEL(_queryResult,0),0)) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};
	_return = SEL(_queryResult,1);
	if(!_multiarr && count _return > 0) then {
		_return = SEL(_return,0);
	};

	_return;
}] call RPP_Function;
publicVariable "RPP_DB_ASYNC";

["RPP_DB_fetchDuty", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT locker_civ, locker_cop, locker_ems, onduty_civ, onduty_cop, onduty_ems FROM Duty WHERE pid='%1'", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Duty Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {
		[] remoteExec ["RPP_Duty_FirstInstert",_ownerID];
	};

	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

	_new = [(_result select 1)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[1,_new];

	_new = [(_result select 2)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[2,_new];

	_tmp = _result select 3;
	_result set[3,[_tmp] call RPP_safeNumber];

	_tmp = _result select 4;
	_result set[4,[_tmp] call RPP_safeNumber];

	_tmp = _result select 5;
	_result set[5,[_tmp] call RPP_safeNumber];

	_result remoteExec ["RPP_Duty_load",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchDuty";

["RPP_insertDuty", {
  	_pid = param [0,"",[""]];
  	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

 	_query = format["INSERT INTO Duty(pid, locker_civ, locker_cop, locker_ems, onduty_civ, onduty_cop, onduty_ems) VALUES ('%1', '""[]""', '""[]""', '""[]""', '1', '0', '0')", _pid];

 	diag_log "------------- Fetch Duty Instert -------------";
	diag_log format["QUERY: %1",_query];
	diag_log "------------------------------------------------";

  	if(_query == "") exitWith {};

  	[_query,1] call RPP_DB_ASYNC;

  	[] remoteExec ["RPP_Duty_CheckSide",_ownerID];
}] call RPP_Function;
publicVariable "RPP_insertDuty";

["RPP_DB_fetchLogin", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp", "_tmp2"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT username, password FROM game_logins WHERE pid='%1'", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Login Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	[_result] remoteExec ["RPP_loadLogin",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchLogin";

["RPP_DB_updateLogin", {
  params ["_username", "_password", "_pid"];
	_username = [_username] call RPP_safeString;
	_password = [_password] call RPP_safeString;

  _query = format["UPDATE game_logins SET username='%1', password='%2' WHERE pid='%3'", _username, _password, _pid];

  if(_query == "") exitWith {};

  [_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_updateLogin";

["RPP_DB_insertLogin", {
  params ["_username", "_password", "_pid"];
	_username = [_username] call RPP_safeString;
	_password = [_password] call RPP_safeString;

  _query = format["INSERT INTO game_logins(pid, username, password) VALUES ('%3', '%1', '%2')", _username, _password, _pid];

  if(_query == "") exitWith {};

  [_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_insertLogin";

["RPP_DB_fetchPlayer", {
	private ["_uid", "_query", "_result", "_curTime", "_tmp"];
	_uid = param [0,"",[""]];
	_ownerID = param [1,ObjNull,[ObjNull]];
	if(isNull _ownerID) exitWith {diag_log "Owner ID is NULL";};
	_ownerID = owner _ownerID;

	_query = format["SELECT pid, name, cash, bank, gear, inventory, licenses, isinjail, copLevel, emtLevel, adminLevel, donorLevel, hunger, thirst, Jail_H, Jail_M, Jail_S, JailPOS, JailDir, Skill_Vehicle, skill_Crafting, Skill_Mining, Skill_Gathering, Skill_Fishing, VehicleStorage, CompanyOwning, InGangName FROM players WHERE pid='%1'", _uid];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Player Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {
		[] remoteExecCall ["RPP_insertPlayer",_ownerID];
	};

	_tmp = _result select 2;
	_result set[2,[_tmp] call RPP_safeNumber];
	_tmp = _result select 3;
	_result set[3,[_tmp] call RPP_safeNumber];
	_tmp = _result select 12;
	_result set[12,[_tmp] call RPP_safeNumber];
	_tmp = _result select 13;
	_result set[13,[_tmp] call RPP_safeNumber];

	_new = [(_result select 4)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[4,_new];

	_new = [(_result select 5)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[5,_new];

	_new = [(_result select 6)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[6,_new];


	_result set[7,([_result select 7,1] call RPP_bool)];
	if ([_result select 7,1] call RPP_bool) then {

	};


	_tmp = _result select 8;
	_result set[8,[_tmp] call RPP_safeNumber];

	_tmp = _result select 9;
	_result set[9,[_tmp] call RPP_safeNumber];

	_tmp = _result select 10;
	_result set[10,[_tmp] call RPP_safeNumber];

	_tmp = _result select 11;
	_result set[11,[_tmp] call RPP_safeNumber];


	_tmp = _result select 19;
	_result set[19,[_tmp] call RPP_safeNumber];
	_tmp = _result select 20;
	_result set[20,[_tmp] call RPP_safeNumber];
	_tmp = _result select 21;
	_result set[21,[_tmp] call RPP_safeNumber];
	_tmp = _result select 22;
	_result set[22,[_tmp] call RPP_safeNumber];
	_tmp = _result select 23;
	_result set[23,[_tmp] call RPP_safeNumber];

	_query = format["SELECT classname, plate, trunk, MaxWeight, Weight, VehStatus, upgrades, isveh, owners FROM vehicles WHERE pid='%1' AND active=0", _uid];

	_curTime = diag_tickTime;
	_vehicles = [_query, 2, true] call RPP_DB_ASYNC;

	diag_log "------------- Fetch Vehicle Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_vehicles];
	diag_log "------------------------------------------------";

	_result set[24, _vehicles];

	_tmp = _result select 25;
	_result set[25,[_tmp] call RPP_safeString];

	_tmp = _result select 26;
	_result set[26,[_tmp] call RPP_safeString];

	_result remoteExec ["RPP_loadPlayer",_ownerID];
}] call RPP_Function;
publicVariable "RPP_DB_fetchPlayer";

["RPP_DB_insertPlayer", {
	private["_queryResult", "_query", "_tickTime"];
	params [
		"_uid",
		"_name",
		["_money",-1,[0]],
		["_bank",-1,[0]],
		["_returnToSender",objNull,[objNull]],
		"_Weight",
		"_skill_Veh",
		"_skill_craft",
		"_skill_Mining",
		"_skill_Gather",
		"_skill_fishing",
		"_0"
	];

	if((_uid == "") OR (_name == "")) exitWith {diag_log "Bad UID or name";};
	if(isNull _returnToSender) exitWith {diag_log "ReturnToSender is Null!";};

	_query = format["SELECT pid, name FROM players WHERE pid='%1'",_uid];

	_tickTime = diag_tickTime;
	_queryResult = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Check Before Insert -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";

	diag_log "INSERT GO";

	if(!(count _queryResult isEqualTo 0)) exitWith {
		diag_log "queryResult = 1";
		[] remoteExecCall ["RPP_fetchPlayer",(owner _returnToSender)];
	};


	_name = [_name] call RPP_safeString;
	_money = [_money] call RPP_safeNumber;
	_bank = [_bank] call RPP_safeNumber;
	_Weight = [_Weight] call RPP_safeNumber;
	_skill_Veh = [_skill_Veh] call RPP_safeNumber;
	_skill_craft = [_skill_craft] call RPP_safeNumber;
	_skill_Mining = [_skill_Mining] call RPP_safeNumber;
	_skill_Gather = [_skill_Gather] call RPP_safeNumber;
	_skill_fishing = [_skill_fishing] call RPP_safeNumber;
	_0 = [_0] call RPP_safeNumber;
	_Array = [];
	_false = str(false);
	_false = [_false] call RPP_safeString;
	_Array = [_Array] call RPP_ArrToSQL;


	_query = format["INSERT INTO players (pid, name, cash, bank, gear, inventory, licenses, Weight, Skill_Vehicle, skill_Crafting, Skill_Mining, Skill_Gathering, Skill_Fishing, adminLevel, emtLevel, copLevel, donorLevel, VehicleStorage, isinjail, Jail_H, Jail_M, Jail_S, JailPOS, JailDir,CompanyOwning) VALUES('%1', '%2', '%3', '%4', '%13','%13','%13','%5','%6','%7','%8','%9','%10','%11','%11','%11','%11','%13','%11','%11','%11','%11','%11','%11','%12')", _uid, _name, _money, _bank,_Weight,_skill_Veh,_skill_craft,_skill_Mining,_skill_Gather,_skill_fishing,_0,_false,_Array];

	[_query,1] call RPP_DB_ASYNC;

	diag_log format ["INSERT PLAYER: %1",_query];

	_bool = false;
	[10,str(_bool),_uid] remoteExec ["RPP_DB_partialSync",2];
	[11,"",_uid] remoteExec ["RPP_DB_partialSync",2];

	[] remoteExecCall ["RPP_fetchPlayer",(owner _returnToSender)];

}] call RPP_Function;
publicVariable "RPP_DB_insertPlayer";

["RPP_DB_partialSync", {
	private ["_query","_mode", "_value1", "_value2", "_data"];
	params ["_mode", "_data", "_pid"];

	switch (_mode) do {
		case 0: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE players SET cash='%1' WHERE pid='%2'", _data, _pid];
		};
		case 1: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE players SET bank='%1' WHERE pid='%2'", _data, _pid];
		};
		case 2: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE players SET licenses='%1' WHERE pid='%2'", _data, _pid];
		};
		case 3: {
			_value1 = _data select 0;
			_value1 = [_value1] call RPP_safeNumber;
			_value2 = _data select 1;
			_value2 = [_value2] call RPP_safeNumber;
			_query = format["UPDATE players SET hunger='%1', thirst='%2' WHERE pid='%3'", _value1, _value2, _pid];
		};
		case 4: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE players SET gear='%1' WHERE pid='%2'", _data, _pid];
		};
		case 5: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE players SET inventory='%1' WHERE pid='%2'", _data, _pid];
		};
		case 6: {
			_value1 = _data select 0;
			_value1 = [_value1] call RPP_safeNumber;
			_value2 = _data select 1;
			_value2 = [_value2] call RPP_safeNumber;
			_value3 = _data select 2;
			_value3 = [_value3] call RPP_safeNumber;
			_value4 = _data select 3;
			_value4 = [_value4] call RPP_safeNumber;
			_value5 = _data select 4;
			_value5 = [_value5] call RPP_safeNumber;
			_query = format["UPDATE players SET Skill_Vehicle='%1', skill_Crafting='%2', Skill_Mining='%3', Skill_Gathering='%4', Skill_Fishing='%5' WHERE pid='%6'", _value1, _value2, _value3, _value4, _value5, _pid];
		};
		case 7: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Duty SET locker_civ='%1' WHERE pid='%2'", _data, _pid];
		};
		case 8: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Duty SET locker_cop='%1' WHERE pid='%2'", _data, _pid];
		};
		case 9: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Duty SET locker_ems='%1' WHERE pid='%2'", _data, _pid];
		};
		case 10: {
			_data = [_data] call RPP_safeString;
			_query = format["UPDATE players SET CompanyOwning='%1' WHERE pid='%2'", _data, _pid];
		};
		case 11: {
			_data = [_data] call RPP_safeString;
			_query = format["UPDATE players SET InGangName='%1' WHERE pid='%2'", _data, _pid];
		};
	};

	if(_query == "") exitWith {};

	[_query,1] call RPP_DB_ASYNC;
}] call RPP_Function;
publicVariable "RPP_DB_partialSync";
