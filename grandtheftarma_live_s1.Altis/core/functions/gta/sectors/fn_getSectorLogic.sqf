/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_class", "_cfg", "_logic" ];
_class = [ _this, 0, "", [""] ] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgSectors" >> _class;
_logic = objNull;

//--- Error checks
if ( _class == "" ) exitWith { _logic };
if ( !isClass _cfg ) exitWith { _logic };

//--- Get logic
_logic = missionNamespace getVariable [ getText ( _cfg >> "logic" ), objNull ];

//--- Return
if ( typeName _logic == typeName objNull ) then { _logic } else { objNull };
