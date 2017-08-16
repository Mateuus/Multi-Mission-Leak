/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_isAdmin" ];

//--- Check if logged in as admin
if ( !isMultiplayer || serverCommandAvailable "#kick" ) exitWith { true };

//--- Check admin level
_isAdmin = ( "GTA_adminLevel" call GTA_fnc_const ) > 0;

_isAdmin
