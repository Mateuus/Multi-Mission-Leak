/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_house", "_trunk", "_message", "_value", "_houseName", "_owner" ];
_house = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_trunk = _house getVariable [ "trunk", [] ];
_message = "";
_value = 0;
_houseName = getText ( configFile >> "CfgVehicles" >> typeOf _house >> "displayName" );
_owner = _house getVariable [ "house_owner", [] ];

//--- Error checks
if ( isNull _house ) exitWith {};
if ( count _owner == 0 ) exitWith {};

//--- Owner info
_owner = _owner select 1;

//--- Action
if ( [ 15, "Searching", "" ] call GTA_fnc_action ) then {

	//--- Check items in trunk
	if ( count _trunk == 0 ) exitWith { titleText [ "House inventory is empty", "PLAIN" ] };
	_trunk = _trunk select 0;

	//--- Search for illegal items
	{

		private [ "_handle", "_var", "_str", "_count" ];
		_handle = _x select 0;
		_var = [ _handle, 0 ] call life_fnc_varHandle;
		_str = [ _var ] call life_fnc_varToStr;
		_count = _x select 1;

		//--- Check if item is illegal
		if ( !( [ _handle ] call GTA_fnc_isVirtualItemLegal ) && { _count > 0 } ) then {

			//--- Push to message
			_message = _message + format [ "%1x %2<br />", _count, _str ];

			//--- Add to illegal value
			_value = _value + ( ( [ _handle ] call GTA_fnc_illegalItemValue ) * _count );

		};

	} forEach _trunk;

	//--- Found illegal items
	if ( _message != "" ) then {

		//--- Reset trunk
		_house setVariable [ "trunk", [ [], 0 ], true ];

		//--- Update house trunk to DB
		[ [ _house ],"TON_fnc_updateHouseTrunk", false ] call GTA_fnc_remoteExec;

		//--- Add value to bank account
		GTA_money_bank = GTA_money_bank + _value;

		//--- Hint illegal items
		[ 1, [ "%1", _message ], [ "Illegal Items", "#ff0000" ] ] call GTA_fnc_broadcast;

		//--- Broadcast value
		[ [ 0, [ "STR_GTA_ACTIONS_SEARCHTRUNK", [ _value ] call life_fnc_numberText, _owner, _houseName, profileName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	} else {

		titleText [ "No illegal items found", "PLAIN" ];

	};

} else {

	titleText [ "Search interrupted", "PLAIN" ];

};
