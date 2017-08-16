/*
	Author: Karel Moricky
	Modified by Huntah for Darkside life

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "DS_fnc_MP_Packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
private ["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function","_callerName","_callerUID","_exitScope"];
_exitScope = false;
_varName = _this select 0;
_varValue = _this select 1;

_mode = 	[_varValue,0,[0]] call bis_fnc_param;
_params = 	[_varValue,1,[]] call bis_fnc_param;
_functionName =	[_varValue,2,"",[""]] call bis_fnc_param;
_target =	[_varValue,3,true,[ObjNull,true,0,[],sideUnknown,GrpNull,""]] call bis_fnc_param;
_isPersistent =	[_varValue,4,false,[false]] call bis_fnc_param;
_isCall =	[_varValue,5,false,[false]] call bis_fnc_param;
_callerName = [_varValue,6,"",[""]] call bis_fnc_param;
_callerUID = [_varValue,7,"",[""]] call bis_fnc_param;

if(_callerName == "" OR _callerUID == "") exitWith {}; //NO.

if (ismultiplayer && _mode == 0) then {
	if (isserver) then {
		if (typename _target == typename []) then {

			//--- Multi execution
			{
				[_varName,[_mode,_params,_functionName,_x,_isPersistent,_isCall,_callerName,_callerUID]] call DS_fnc_MPexec;
			} foreach _target;
		} else {

			//--- Single execution
			private ["_ownerID","_serverID"];
			_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0

			//--- Server process
			switch (typename _target) do {
				case (typename objnull): {
					_ownerID = owner _target;
				};
				case (typename true): {
					_ownerID = [_serverID,-1] select _target;
				};
				case (typename 0): {
					_ownerID = _target;
				};
				case (typename grpnull);
				case (typename sideUnknown): {
					_ownerID = -1;
				};
				case (typeName ""): {
					_ownerID = -1;
				};
			};
			DS_fnc_MP_Packet = [1,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];

			//--- Send to clients
			if (_ownerID < 0) then {
				//--- Everyone
				publicvariable "DS_fnc_MP_Packet";
			} else {
				if (_ownerID != _serverID) then {
					//--- Client
					_ownerID publicvariableclient "DS_fnc_MP_Packet";
				};
			};

			//--- Server execution (for all or server only)
			if (_ownerID < 0 || _ownerID == _serverID) then {
				["DS_fnc_MP_Packet",DS_fnc_MP_Packet] spawn DS_fnc_MPexec;
			};

			//--- Persistent call (for all or clients)
			if (_isPersistent) then {
				if (typename _target != typename 0) then {
					private ["_logic","_queue"];
					_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
					_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
					_queue set [
						count _queue,
						+DS_fnc_MP_Packet
					];
					_logic setvariable ["BIS_fnc_MP_queue",_queue,true];
				} else {
					["Persistent execution is not allowed when target is %1. Use %2 or %3 instead.",typename 0,typename objnull,typename false] call bis_fnc_error;
				};
			};
		};
	};

} else {
	//--- Client
	private ["_canExecute"];
	_canExecute = switch (typename _target) do {
		case (typename grpnull): {player in units _target};
		case (typename sideUnknown): {playerside == _target;};
		case (typeName ""): {if(!isNull player) then {getPlayerUID player == _target;} else {false}};
		default {true};
	};

	if (_canExecute) then {
		_function = missionnamespace getvariable _functionName;
		if (!isnil "_function") then {
			if (_isCall) then {
				_params call _function;
			} else {
				_params spawn _function;
			};
			true
		} else {
			["Function '%1' does not exist",_functionName] call bis_fnc_error;
			false
		};
	};
};