/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_cfg", "_dlc", "_appId" ];
_cfg = [ _this, 0, configFile, [configFile] ] call GTA_fnc_param;
_dlc = getText ( _cfg >> "DLC" );

//--- Not DLC item
if ( _dlc == "" ) exitWith { true };

//--- Retrive the Steam AppId
_appId = getNumber ( configFile >> "CfgMods" >> _dlc >> "appId" );

//--- Return
_appId in getDLCs 1
