/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_params", "_functionName", "_target", "_isPersistent", "_isCall", "_varName", "_varValue", "_function", "_exitScope" ];

_varName = _this select 0;
_varValue = _this select 1;

_mode = [ _varValue, 0, [0] ] call GTA_fnc_param;
_params = [ _varValue, 1, [] ] call GTA_fnc_param;
_functionName =	[ _varValue, 2, "", [""] ] call GTA_fnc_param;
_target = [ _varValue, 3, true, [objNull,true,0,[],sideUnknown,grpNull,""] ] call GTA_fnc_param;
_isPersistent =	false/*[ _varValue, 4, false, [false] ] call GTA_fnc_param*/;
_isCall = [ _varValue, 5, false, [false] ] call GTA_fnc_param;


//--- Secuirty checks
_exitScope = false;

//--- Check BIS functions
if ( [ "BIS_fnc_", _functionName ] call GTA_fnc_inString && { !( toLower _functionName in [ "bis_fnc_execvm", "bis_fnc_effectkilledairdestruction", "bis_fnc_effectkilledairdestructionstage2", "bis_fnc_setdate", "bis_fnc_setovercast", "bis_fnc_setfog" ] ) } ) exitWith {};

//--- Blacklist functions
if ( getNumber ( missionConfigFile >> "CfgRemoteExecFunctions" >> _functionName >> "disabled" ) > 0 ) exitWith {};

//--- Check BIS_fnc_execVM
if ( !_exitScope && { _functionName == "BIS_fnc_execVM" } ) then {

	//--- Get script path
	private "_script";
	_script = +_params;

	if ( typeName _params == typeName [] ) then {

		_script = _script select 1;

	};

	_exitScope = !( _script == "initPlayerServer.sqf" );

};

//--- Exit
if ( _exitScope ) exitWith { false };

//--- Check single or mutli execution
if ( typeName _target == typeName [] ) then {

	//--- Multi execution
	{ [ _varName, [ _mode, _params, _functionName, _x, _isPersistent, _isCall ] ] call GTA_fnc_MPexec; } foreach _target;

} else {

	//--- Single execution
	if ( isMultiplayer && _mode == 0 ) then {

		private [ "_ownerID", "_serverID" ];
		_serverID = owner ( missionNamespace getVariable [ "BIS_functions_mainscope",objNull ] ); //--- Server ID is not always 0

		//--- Server process
		switch ( typeName _target ) do {

			case ( typeName "" ): {

				_ownerID = owner ( missionNamespace getVariable [ _target,objNull ] );

			};
			case ( typeName objNull ): {

				private [ "_targetCuratorUnit" ];
				_targetCuratorUnit = getAssignedCuratorUnit _target;
				if !( isNull _targetCuratorUnit ) then { _target = _targetCuratorUnit; };
				_ownerID = owner _target;

			};
			case ( typeName true ): {

				_ownerID = [ _serverID, -1 ] select _target;

			};
			case ( typeName 0 ): {

				_ownerID = _target;

			};
			case ( typeName grpNull );
			case ( typeName sideUnknown ): {

				_ownerID = -1;

			};

		};

		GTA_fnc_MP_packet = [ 1, _params, _functionName, _target, _isPersistent, _isCall ];

		//--- Send to clients
		if ( _ownerID < 0 ) then {

			//--- Everyone
			publicVariable "GTA_fnc_MP_packet";

		} else {

			if (_ownerID != _serverID) then {

				//--- Client
				_ownerID publicVariableClient "GTA_fnc_MP_packet";

			};

		};

		//--- Server execution (for all or server only)
		if ( _ownerID == -1 || _ownerID == _serverID ) then {

			[ "GTA_fnc_MP_packet", GTA_fnc_MP_packet ] call GTA_fnc_MPexec;

		};

		//--- Persistent call (for all or clients)
		if ( _isPersistent ) then {

			if ( typeName _target != typeName 0 ) then {

				private [ "_logic", "_queue" ];
				_logic = missionNamespace getVariable [ "BIS_functions_mainscope", objNull ];
				_queue = _logic getVariable [ "BIS_fnc_MP_queue", [] ];
				_queue set [ count _queue, +GTA_fnc_MP_packet ];
				_logic setvariable [ "BIS_fnc_MP_queue", _queue, true ];

			} else {

				[ "Persistent execution is not allowed when target is %1. Use %2 or %3 instead.", typeName 0, typeName objNull, typeName false ] call BIS_fnc_error;

			};

		};

	} else {

		//--- Local execution
		private [ "_canExecute" ];
		_canExecute = switch ( typeName _target ) do {

			case ( typeName grpNull ): { player in units _target };
			case ( typeName sideUnknown ): { ( player call BIS_fnc_objectside ) == _target };
			default { true };

		};

		if ( _canExecute ) then {

			_function = missionNamespace getVariable _functionName;
			if !( isNil "_function" ) then {

				//--- Function
				if ( _isCall ) then {

					_params call _function;

				} else {

					_params spawn _function;

				};
				true

			} else {

				_supportInfo = supportInfo format [ "*:%1*", _functionName ];
				if ( count _supportInfo > 0 ) then {

					//--- Scripting command
					_cfgRemoteExecCommands = [ [ "CfgRemoteExecCommands" ], configfile ] call BIS_fnc_loadClass;
					if ( isClass ( _cfgRemoteExecCommands >> _functionName ) ) then {

						_paramCount = if ( typeName _params == typeName [] ) then { count _params } else { 1 };
						switch ( _paramCount ) do {

							case 0: { _params call compile format [ "%1", _functionName ]; true };
							case 1: { _params call compile format [ "%1 (_this)", _functionName ]; true };
							case 2: { _params call compile format [ "(_this select 0) %1 (_this select 1)", _functionName ]; true };
							default { [ "Error when remotely executing '%1' - wrong number of arguments (%2) passed, must be 0, 1 or 2", _functionName, count _params ] call BIS_fnc_error; false };

						};

					} else {

						//--- Banned commands
						[ "Scripting command '%1' is not allowed to be remotely executed", _functionName ] call BIS_fnc_error;
						false

					};

				} else {

					//--- Error
					[ "Function or scripting command '%1' does not exist", _functionName ] call BIS_fnc_error;
					false

				};

			};

		};

	};

};
