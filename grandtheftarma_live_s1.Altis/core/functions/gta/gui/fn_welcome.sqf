/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

createDialog "GTA_RscDisplayWelcome";
waitUntil { [ "GTA_RscDisplayWelcome" ] call GTA_fnc_hasDisplay };
waitUntil { !( [ "GTA_RscDisplayWelcome" ] call GTA_fnc_hasDisplay ) };
