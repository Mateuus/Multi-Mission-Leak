/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_items" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith { false };

//--- Get assigned items
_items = assignedItems _unit;

//--- Condition
( "ItemGPS" in _items
|| { "B_UavTerminal" in _items }
|| { "O_UavTerminal" in _items }
|| { "I_UavTerminal" in _items } )
