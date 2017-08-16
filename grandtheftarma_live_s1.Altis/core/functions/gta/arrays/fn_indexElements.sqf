/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_blacklist", "_return" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_blacklist = [];
_return = [];

{

	private "_element";
	_element = _x;

	//--- Check if element is blacklisted
	if !( _element in _blacklist ) then {

		private "_count";
		_count = { _element == _x } count _array;

		//--- Push element + count
		_return pushBack [ _element, _count ];

		//--- Blacklist the element
		_blacklist pushBack _element;

	};

} forEach _array;

_return
