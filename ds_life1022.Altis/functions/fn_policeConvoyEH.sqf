/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Adds event handlers to police convoys
*/

params [["_vehicle",objNull,[objNull]]];

if(isNull _vehicle)exitwith{};

_vehicle addEventHandler ["HandleDamage", {
	_vehicle = _this select 0;
	_damage = _this select 2;

	if(alive _vehicle)then {
		if(_damage > 0.2)then {
			_vehicle setHitPointDamage["HitLFWheel",1];
			_vehicle setHitPointDamage["HitLF2Wheel",1];
			_vehicle setHitPointDamage["HitRFWheel",1];

			if(_damage > 1)then {
				if(local _vehicle)then {
					_vehicle setFuel _newFuel;
				} else {
					[_vehicle,0] remoteExecCall ["DS_fnc_setFuel",_vehicle];
				};
			};
		};
	};

	false;
}];