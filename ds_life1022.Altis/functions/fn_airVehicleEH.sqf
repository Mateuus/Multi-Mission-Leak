/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Adds event handlers to air vehicles
*/

params [["_vehicle",objNull,[objNull]]];

if(isNull _vehicle)exitWith{};

_vehicle addEventHandler ["RopeAttach", {
	_object = _this select 2;

	_object spawn {
		_sleep = random 3;
		sleep _sleep;

		if(!local _this)then {
			[_this,player,(vehicle player)] remoteExec ["HUNT_fnc_changeOwner",2];
		};
	};
}];