/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_class", "_type" ];
_object = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_class = [ _this, 1, "", [""] ] call GTA_fnc_param;

//--- Item info
_itemInfo = [ _class] call BIS_fnc_itemType;
_category = _itemInfo select 0;
_type = _itemInfo select 1;

//--- Error checks
if ( isNil _object ) exitWith {};
if ( _category == "" ) exitWith {};
