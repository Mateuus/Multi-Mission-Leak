/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_class", "_logic", "_capturing", "_tick" ];
_class = [ _this, 0, "", [""] ] call GTA_fnc_param;
_logic = [ _class ] call GTA_fnc_getSectorLogic;

//--- Error checks
if ( _class == "" ) exitWith { false };
if ( isNull _logic ) exitWith { false };

//--- Config
_captureTime = getNumber ( _cfg >> "captureTime" );

//--- Variables
_capturing = _logic getVariable [ "sector_capturing", false ];
_tick = _logic getVariable [ "sector_capturing_tick", 0 ];

//--- Condition
if ( _capturing ) then {

	//--- Failsafe
	( time < ( _tick + _captureTime ) + 20 )

} else {

	false

};
