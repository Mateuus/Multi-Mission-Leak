/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_item", "_count", "_cfg", "_weight" ];
_item = [ _this, 0, "", [""] ] call GTA_fnc_param;
_count = [ _this, 1, 1, [0] ] call GTA_fnc_param;

//--- Error checks
if ( _item == "" ) exitWith { false };

//--- Check if the item can be added
if !( [ _item, _count ] call GTA_fnc_canAddVirtualItem ) exitWith { false };

//--- Add item to inventory array
[ GTA_VirtualInventory_items, _item, _count, true ] call GTA_fnc_arrayAddKey;

true
