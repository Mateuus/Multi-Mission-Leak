/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_type", "_cfg" ];
_type = [ _this, 0, "", [""] ] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgLicenseShops" >> _type;

//--- Error checks
if ( _type == "" ) exitWith {};
if ( !isClass _cfg ) exitWith {};
if ( getText ( _cfg >> "faction" ) != [ player ] call GTA_fnc_faction ) exitWith {};

//--- Set shop type in global namespace
GTA_RscDisplayLicenseShop_type = _type;

//--- Create shop display
createDialog "GTA_RscDisplayLicenseShop";
