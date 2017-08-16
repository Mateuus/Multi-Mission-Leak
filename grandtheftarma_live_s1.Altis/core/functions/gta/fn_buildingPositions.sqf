/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_building", "_count", "_return" ];
_building = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_count = 0;
_return = [];

//--- Loop until we run out of positions
while { !( _building buildingPos _count isEqualTo [ 0, 0, 0 ] ) } do {

	//--- Push the position to the return array
	_return pushBack ( _building buildingPos _count );

	//--- Increment
	_count = _count + 1;

};

_return
