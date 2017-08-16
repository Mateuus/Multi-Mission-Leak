/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_class", "_flag", "_logic", "_cfg", "_captureFactions", "_captureType", "_captureTime", "_drawMarker", "_flagTexture", "_owner", "_ownerName", "_marker", "_markerType", "_markerColor", "_markerText" ];
_class = [ _this, 0, "", [""] ] call GTA_fnc_param;
_flag = [ _this, 1, objNull, [objNull] ] call GTA_fnc_param;
_logic = [ _class ] call GTA_fnc_getSectorLogic;
_cfg = missionConfigFile >> "GTA_CfgSectors" >> _class;

//--- Error checks
if ( _class == "" ) exitWith { false };
if ( isNull _logic ) exitWith { false };
if ( !isClass _cfg ) exitWith { false };

//--- Config
_name = getText ( _cfg >> "name" );
_captureFactions = getArray ( _cfg >> "captureFactions" );
_captureType = getText ( _cfg >> "captureType" );
_captureTime = getNumber ( _cfg >> "captureTime" );
_drawMarker = getNumber ( _cfg >> "marker" );
_persistent = getNumber ( _cfg >> "persistent" );

//--- Check type group gang
if ( _captureType == "group_g" && { playerSide == civilian } && { isNil { ( group player ) getVariable "gang_name" } } ) exitWith { titleText [ format [ localize "STR_GTA_SECTORS_GANGONLY", _name ], "PLAIN" ]; false };

//--- Check owner
if ( [ _class ] call GTA_fnc_ownsSector ) exitWith { titleText [ format [ localize "STR_GTA_SECTORS_OWNED", _name ], "PLAIN" ]; false };

//--- Check capturing
if ( [ _class ] call GTA_fnc_isSectorCapturing ) exitWith { titleText [ format [ localize "STR_GTA_SECTORS_BEINGCAPTURED", _name ], "PLAIN" ]; false };

//--- Check faction
if !( ( [] call GTA_fnc_faction ) in _captureFactions ) exitWith { false };

//--- Capture variables
_logic setVariable [ "sector_capturing", true, true ];
_logic setVariable [ "sector_capturing_tick", time, true ];

//--- Broadcast capture message
[ [ [ 0, 1 ], [ "STR_GTA_SECTORS_CAPTURING", _name ], [ "Notice", "#ffffff" ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

//--- Capture action
if ( [ _captureTime + ( random 5 ), "Capturing", nil, { !( [ _this ] call GTA_fnc_ownsSector ) }, _class ] call GTA_fnc_action ) then {

	//--- Check ownership again
	if ( [ _class ] call GTA_fnc_ownsSector ) exitWith { titleText [ format [ localize "STR_GTA_SECTORS_OWNED", _name ], "PLAIN" ]; false };

	//--- Flag
	if ( !isNull _flag ) then {

		//--- Get random flag texture
		private "_flagTexture";

		if ( _captureType == "side" ) then {

			_flagTexture = switch playerSide do {

				case west: { "\A3\Data_F\Flags\flag_nato_co.paa" };
				case independent: { "\A3\Data_F\Flags\flag_altis_co.paa" };
				case civilian: { "\A3\Data_F\Flags\flag_aaf_co.paa" };
				default { "\A3\Data_F\Flags\flag_white_co.paa" };

			};

		} else {

			_flagTexture = [

				"\A3\Data_F\Flags\Flag_red_CO.paa",
				"\A3\Data_F\Flags\Flag_green_CO.paa",
				"\A3\Data_F\Flags\Flag_blue_CO.paa",
				"\A3\Data_F\Flags\Flag_white_CO.paa",
				"\A3\Data_F\Flags\flag_fd_red_CO.paa",
				"\A3\Data_F\Flags\flag_fd_green_CO.paa",
				"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
				"\A3\Data_F\Flags\flag_fd_orange_CO.paa"

			] call BIS_fnc_selectRandom;

		};

		//--- Set flag texture
		[ [ _flag, _flagTexture ], "setFlagTexture", _flag ] call GTA_fnc_remoteExec;

	};

	//--- Capture type
	_owner = switch _captureType do {

		case "group_g";
		case "group": { group player };
		case "side": { playerSide };
		case "unit": { player };

	};

	//--- Exit if nil
	if ( isNil "_owner" ) exitWith {};

	//--- Set variables
	_logic setVariable [ "sector_owner", _owner, true ];
	_logic setVariable [ "sector_capturing", false, true ];

	//--- Get owner name
	_ownerName = [ _class ] call GTA_fnc_sectorOwnerName;

	//--- Broadcast capture message
	[ [ [ 0, 1 ], [ "STR_GTA_SECTORS_CAPTURED", _name, _ownerName ], [ "Notice", "#ffffff" ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	//--- Marker
	if ( _drawMarker > 0 ) then {

		//--- Get previous marker
		_marker = _logic getVariable "sector_marker";

		if ( isNil "_marker" ) then {

			_markerType = getText ( _cfg >> "markerType" );
			_markerColor = getText ( _cfg >> "markerColor" );

			//--- Default marker parameters
			if ( _markerType == "" ) then { _markerType == "hd_flag" };
			if ( _markerColor == "" ) then { _markerColor == "ColorGreen" };

			//--- Create marker
			_marker = createMarker [ format [ "%1_marker", _class ], position _logic ];
			_marker setMarkerType _markerType;
			_marker setMarkerColor _markerColor;

			//--- Store marker
			_logic setVariable [ "sector_marker", _marker, true ];

		};

		//--- Set marker text
		_markerText = getText ( _cfg >> "markerText" );
		if ( _markerText == "" ) then { _markerText = "Captured by %1" };

		_marker setMarkerText format [ _markerText, _ownerName, _name ];

	};

	true

} else {

	_logic setVariable [ "sector_capturing", false, true ];
	titleText [ "Capture interrupted", "PLAIN" ];
	false

};
