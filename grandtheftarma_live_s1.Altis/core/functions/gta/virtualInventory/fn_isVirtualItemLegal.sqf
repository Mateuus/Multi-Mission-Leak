/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_handle", "_index" ];
_handle = [ _this, 0, "", [""] ] call GTA_fnc_param;
_index = [ life_illegal_items, _handle ] call GTA_fnc_nestedIndex;

//--- Return
!( _index != -1 )
