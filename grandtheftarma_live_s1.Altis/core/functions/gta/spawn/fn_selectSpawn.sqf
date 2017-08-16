/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_showBG";
_showBG = [ _this, 0, true, [true] ] call GTA_fnc_param;

if ( life_is_gta_arrested ) exitWith { [] call life_fnc_respawned };

//--- Background layer
if ( _showBG ) then {

	( "GTA_spawn_noise" call BIS_fnc_rscLayer ) cutRsc [ "SplashNoise", "BLACK" ];

};

//--- Open the display
createDialog "GTA_RscDisplaySpawnSelection";
waitUntil { [ "GTA_RscDisplaySpawnSelection" ] call GTA_fnc_hasDisplay };
waitUntil { !( [ "GTA_RscDisplaySpawnSelection" ] call GTA_fnc_hasDisplay ) };

//--- Close background layer
if ( _showBG ) then {

	( "GTA_spawn_noise" call BIS_fnc_rscLayer ) cutText [ "", "PLAIN" ];

};
