/*
	File: antiVDM.sqf
	Author: Matthew "ParallelGames"
	
	Description:
	Handles damage and removes any vehicle damage to stop VDM.
*/

player addEventHandler ["HandleDamage", {
	_this spawn {
		_source = _this select 3;
		if (_source isKindOf "LandVehicle") then {
			if (playerSide == independent) then
			{
				// Don't make EMS take damage from cars. Removes the risk of retards hitting them while they're reviving in the middle of the road.
				player setDamage 0;
			} else {
				// Leave everyone else that gets hit by a vehicle with 30HP. 
				player setDamage 0.7;
			};
		};
	};
}];