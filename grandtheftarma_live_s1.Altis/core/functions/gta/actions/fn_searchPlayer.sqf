/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_mode", "_unit", "_items", "_name", "_message", "_value" ];
_mode = [ _this, 0, 0, [0] ] call GTA_fnc_param;

//--- Mode
switch _mode do {

	//--- Action
	case 0: {

		_unit = [ _this, 1, objNull, [objNull] ] call GTA_fnc_param;

		//--- Search action
		if ( [ 10, "Searching", "", { player distance _this < 4 }, _unit ] call GTA_fnc_action ) then {

			//--- Checks
			if ( alive _unit && { _unit getVariable [ "restrained", false ] } ) then {

				//--- Send to unit
				[ [ 1, player ], _fnc_scriptName, _unit ] call GTA_fnc_remoteExec;

			} else {

				titleText [ "Unable to search person", "PLAIN" ];

			};

		} else {

			titleText [ "Search interrupted", "PLAIN" ];

		};

	};

	//--- Receive
	case 1: {

		_unit = [ _this, 1, objNull, [objNull] ] call GTA_fnc_param;
		_items = [];

		//-- Check for illegal items
		{

			private [ "_handle", "_count" ];
			_handle = [ _x select 0, 0 ] call life_fnc_varHandle;
			_count = missionNamespace getVariable _handle;

			if ( _count > 0 ) then {

				_items pushBack [ _x select 0, _count ];
				[ false, _x select 0, _count ] call life_fnc_handleInv;

			};

		} foreach life_illegal_items;

		//--- Reply to sender
		[ [ 2, _items, profileName ], _fnc_scriptName, _unit ] call GTA_fnc_remoteExec;

	};

	//--- Replied
	case 2: {

		_items = [ _this, 1, [], [[]] ] call GTA_fnc_param;
		_name = [ _this, 2, "", [""] ] call GTA_fnc_param;
		_message = "";
		_value = 0;

		if ( count _items > 0 ) then {

			//--- Format message
			{

				private [ "_handle", "_var", "_str", "_count" ];
				_handle = _x select 0;
				_var = [ _handle, 0 ] call life_fnc_varHandle;
				_str = [ _var ] call life_fnc_varToStr;
				_count = _x select 1;

				//--- Push to message
				_message = _message + format [ "%1x %2<br />", _count, _str ];

				//--- Add to illegal value
				_value = _value + ( ( [ _handle ] call GTA_fnc_illegalItemValue ) * _count );

			} forEach _items;

			//--- Add value to bank account
			GTA_money_bank = GTA_money_bank + _value;

			//--- Hint illegal items
			[ 1, [ "%1", _message ], [ "Illegal Items", "#ff0000" ] ] call GTA_fnc_broadcast;

			//--- Broadcast value
			[ [ 0, [ "STR_GTA_ACTIONS_SEARCHPLAYER", [ _value ] call life_fnc_numberText, _name ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

		} else {

			titleText [ "No illegal items found", "PLAIN" ];

		};

	};

};
