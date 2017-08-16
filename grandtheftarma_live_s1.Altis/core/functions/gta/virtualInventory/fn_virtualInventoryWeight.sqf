/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_return";
_return = 0;

//--- Loop through items
{

	private [ "_item", "_count", "_cfg", "_weight" ];
	_item = _x select 0;
	_count = _x select 1;

	//--- Get item configuration
	_cfg = missionConfigFile >> "GTA_CfgVirtualItems" >> _item;
	_weight = getNumber ( _cfg >> "weight" );

	//--- Append return weight
	_return = _return + ( _weight * _count );

} forEach GTA_VirtualInventory_items;

_return
