/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_handle", "_index", "_value" ];
_handle = [ _this, 0, "", [""] ] call GTA_fnc_param;
_index = [ life_illegal_items, _handle ] call GTA_fnc_nestedIndex;
_value = 0;

//--- Is a member of the illegal array
if ( _index != -1 ) then {

	_value = ( life_illegal_items select _index ) select 1;

};

_value
