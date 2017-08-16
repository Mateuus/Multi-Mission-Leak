/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_item", "_count", "_cfg", "_weight", "_inventoryWeight" ];
_item = [ _this, 0, "", [""] ] call GTA_fnc_param;
_count = [ _this, 1, 1, [0] ] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgVirtualItems" >> _item;

//--- Error checks
if ( _item == "" ) exitWith { false };
if !( isClass _cfg ) exitWith { false };

//--- Get item configuration
_weight = getNumber ( _cfg >> "weight" );

//--- Retrieve inventory weight
_inventoryWeight = [] call GTA_fnc_virtualInventoryWeight;

//--- Check if weight will exceed limit
!( _inventoryWeight + ( _weight * _count ) > GTA_VirtualInventory_maxWeight )
