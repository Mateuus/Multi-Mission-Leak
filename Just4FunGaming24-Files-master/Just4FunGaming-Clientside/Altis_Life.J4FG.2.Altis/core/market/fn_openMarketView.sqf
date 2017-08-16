// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( !(createDialog "XY_dialog_marketView") ) exitWith {};

disableSerialization;
waitUntil { !isNull (findDisplay 39500) };

[] spawn XY_fnc_refreshMarketView;