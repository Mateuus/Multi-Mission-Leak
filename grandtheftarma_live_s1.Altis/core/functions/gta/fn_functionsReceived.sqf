/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_functions" ];
_functions = GTA_broadcastFunctions;

{

	waitUntil { !isNil _x };

} forEach _functions;

//--- Dispose function names
GTA_broadcastFunctions = nil;

true
