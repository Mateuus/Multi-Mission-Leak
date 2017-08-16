/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_cond", "_result" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_cond = [ _this, 1, {}, [{}] ] call GTA_fnc_param;
_result = [];

{

	if ( [] call _cond ) then { _result pushBack _x };

} count _array;

_result
