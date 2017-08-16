#include "\RPProject_ServerNew\macros.hpp"
/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_extDB_House.sqf

Description:
extDB database stuff
*/
["RPP_DB_insertHouse", {
	private ["_pos","_building"];
	_pos = _this select 0;
	_building = _this select 1;
	_pos = [_pos] call RPP_ArrToSQL;
	_query = format["SELECT pos FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House Insert Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {
		session_finished = true;
	};
  	if(_query == "") exitWith {};
  	[_pos] remoteExec ["RPP_DB_Load_House",2];
}] call RPP_Function;
publicVariable "RPP_DB_insertHouse";

["RPP_DB_House_MarkersGet", {
	private ["_pos","_building","_pid","_player","_query","_result"];
	_pos = _this select 0;
	_building = _this select 1;
	_pid = _this select 2;
	_player = _this select 3;
	_pos = [_pos] call RPP_ArrToSQL;
	_query = format["SELECT pid, pos FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House markers Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {};
  	if(_query == "") exitWith {};
  	if (!(_result select 0 isEqualTo _pid)) exitWith {};

  	[_result select 1] remoteExec ["RPP_Housing_Markers",_player];
}] call RPP_Function;
publicVariable "RPP_DB_House_MarkersGet";

["RPP_DB_House_GetInfo", {
	private ["_pos","_player","_query","_result"];
	_pos = _this select 0;
	_player = _this select 1;
	_pos = [_pos] call RPP_ArrToSQL;
	_query = format["SELECT mainowner, weight, MaxWeight, Trunk, pid pos FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House info Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {};
  	if(_query == "") exitWith {};

  	_tmp = _result select 0;
	_result set[0,[_tmp] call RPP_safeString];

	_tmp = _result select 1;
	_result set[1,[_tmp] call RPP_safeNumber];

	_tmp = _result select 2;
	_result set[2,[_tmp] call RPP_safeNumber];

	_new = [(_result select 3)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[3,_new];

	_tmp = _result select 4;
	_result set[4,[_tmp] call RPP_safeNumber];

  	_result remoteExec ["RPP_Housing_ReturnInfo",_player];
}] call RPP_Function;
publicVariable "RPP_DB_House_GetInfo";

["RPP_DB_House_GetTrunk", {
	private ["_pos","_player","_query","_result"];
	_pos = _this select 0;
	_player = _this select 1;
	_pos = [_pos] call RPP_ArrToSQL;
	_query = format["SELECT Trunk, pos FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House info Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {};
  	if(_query == "") exitWith {};

  	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

  	_result remoteExec ["RPP_Housing_ViewTrunk",_player];
}] call RPP_Function;
publicVariable "RPP_DB_House_GetTrunk";

["RPP_DB_insertHouse_buy", {
	private ["_pos","_building"];
	_pos = _this select 0;
	_building = _this select 1;
	_player = _this select 2;
	_maxweight = _this select 3;
	_pos = [_pos] call RPP_ArrToSQL;


	diag_log format ["Debug: %1 | %2",_pos,_building];


	_query = format["SELECT pid, pos FROM Housing WHERE pos='%1'", _pos];
	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House check owner Insert Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";


	if (!(count _result isEqualTo 0)) exitWith {
		diag_log "Someone already own this house.";
		[_result select 0] remoteExec ["RPP_Housing_BuyHouse_Failed",_player];
	};

	_query = format["SELECT pos FROM Housing WHERE pos='%1'", _pos];
	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House Buy Insert Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {
		_owners = [];
		_owners = _owners + [[name _player,getPlayerUID _player]];
		_owners = [_owners] call RPP_ArrToSQL;

		_query = format["INSERT INTO Housing(pid, mainowner, owners, house, pos, trunk, locked, weight, Maxweight) VALUES ('%4', '%5', '%6', '""%1""', '%2', '""[]""', '1', '0', '%3')", _building,_pos,_maxweight,getPlayerUID _player,name _player,_owners];
		diag_log format["INSERT QUERY: %1",_query];
		[_query,1] call RPP_DB_ASYNC;

		[_building] remoteExec ["RPP_Housing_BuyHouse_Final",_player];

		[_pos] spawn {
			_pos = _this select 0;
			sleep 1;
			[_pos] remoteExec ["RPP_DB_Load_House",2];
		};
	};
}] call RPP_Function;
publicVariable "RPP_DB_insertHouse_buy";

["RPP_DB_Load_House", {
	private ["_query", "_result", "_curTime", "_tmp"];
	_pos = _this select 0;

	_query = format["SELECT pid, mainowner, owners, house, pos, trunk, locked, weight, Maxweight FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;

	diag_log "------------- Fetch House Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";



		_tmp = _result select 0;
		_result set[0,[_tmp] call RPP_safeNumber];

		_tmp = _result select 1;
		_result set[1,[_tmp] call RPP_safeString];

		_new = [(_result select 2)] call RPP_SQLToArr;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_result set[2,_new];

		_tmp = _result select 3;
		_result set[3,[_tmp] call RPP_safeString];

		_new = [(_result select 4)] call RPP_SQLToArr;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_result set[4,_new];

		_new = [(_result select 5)] call RPP_SQLToArr;
		if(_new isEqualType "") then {_new = call compile format["%1", _new];};
		_result set[5,_new];

		_tmp = _result select 6;
		_result set[6,[_tmp] call RPP_safeNumber];

		_tmp = _result select 7;
		_result set[7,[_tmp] call RPP_safeNumber];

		_tmp = _result select 8;
		_result set[8,[_tmp] call RPP_safeNumber];

		_result remoteExec ["RPP_Housing_SetVariable_House"];
}] call RPP_Function;
publicVariable "RPP_DB_Load_House";

["RPP_DB_House_UpdateOwners", {
	private ["_pos","_player","_query","_result"];
	_house = _this select 0;
	_pos = _this select 1;
	_updateOwners = _this select 2;
	_player = _this select 3;
	_sender = _this select 4;
	_pos = [_pos] call RPP_ArrToSQL;

	_query = format["SELECT owners, pos, pid FROM Housing WHERE pos='%1'", _pos];

	_curTime = diag_tickTime;
	_result = [_query,2] call RPP_DB_ASYNC;


	diag_log "------------- Fetch House update owner Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _curTime)];
	diag_log format["Result: %1",_result];
	diag_log "------------------------------------------------";

	if(count _result isEqualTo 0) exitWith {};
  	if(_query == "") exitWith {};

  	_id = [_result select 2] call RPP_safeString;

  	_new = [(_result select 0)] call RPP_SQLToArr;
	if(_new isEqualType "") then {_new = call compile format["%1", _new];};
	_result set[0,_new];

	_c = true;

	{
		if (getPlayerUID _player == _x select 1) exitWith {
			[] remoteExec ["RPP_DB_Respondto_Client",_player];
			[] remoteExec ["RPP_DB_Respondto_Sender",_sender];
			_c = false;
		};
	} count _new;

	if (!(_c)) exitWith {};

  	[2,[_result select 0,_updateOwners],_pos] remoteExec ["RPP_DB_partialSync_House",2];

  	_msg = "You successfully sent him the keys.";
  	[_msg] remoteExec ["RPP_DB_KeySend_Respond",_sender];

  	_msg = format ["%1 just sent you a copy of his keys for his house.",name _sender];
  	[_msg] remoteExec ["RPP_DB_KeySend_Respond",_player];
}] call RPP_Function;
publicVariable "RPP_DB_House_UpdateOwners";

["RPP_DB_KeySend_Respond", {
	params ["_msg"];

	[_msg,RPP_Yellow] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_DB_KeySend_Respond";

["RPP_DB_Respondto_Client", {
	["You already have the key for this house.",RPP_Red] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_DB_Respondto_Client";

["RPP_DB_Respondto_Sender", {
	["This player already got the keys for this house.",RPP_Red] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_DB_Respondto_Sender";

["RPP_DB_partialSync_House", {
	private ["_query","_mode", "_value1", "_value2", "_data"];
	params ["_mode", "_data", "_pos"];

	if (!(_mode isEqualTo 2)) then {
		_pos = [_pos] call RPP_ArrToSQL;
	};

	switch (_mode) do {
		case 0: {
			_data = [_data] call RPP_ArrToSQL;
			_query = format["UPDATE Housing SET trunk='%1' WHERE pos='%2'", _data, _pos];
			diag_log format["QUERY: %1",_query];
		};
		case 1: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Housing SET weight='%1' WHERE pos='%2'", _data, _pos];
			diag_log format["QUERY: %1",_query];
		};
		case 2: {
			_old = _data select 0;
			_new = _data select 1;
			_old = _old + _new;
			_old = [_old] call RPP_ArrToSQL;
			_query = format["UPDATE Housing SET owners='%1' WHERE pos='%2'", _old, _pos];
			diag_log format["QUERY: %1",_query];
		};
		case 3: {
			_data = [_data] call RPP_safeNumber;
			_query = format["UPDATE Housing SET locked='%1' WHERE pos='%2'", _data, _pos];
			diag_log format["QUERY: %1",_query];
		};
	};

	if(_query == "") exitWith {};
	[_query,1] call RPP_DB_ASYNC;

	[_pos] remoteExec ["RPP_DB_Load_House",2];
}] call RPP_Function;
publicVariable "RPP_DB_partialSync_House";