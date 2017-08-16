/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (isNil "GTA_revive_units") then {
	if (isServer) then {
		GTA_revive_units = [];
		publicVariable "GTA_revive_units";
	} else {
		waitUntil {!isNil "GTA_revive_units"};
	};
};

if (hasInterface) then {
	waitUntil {!isNull player};
	waitUntil {local player};

	//--- Handle existing revive units
	[] spawn {
		while {true} do {

			//--- Loop through revive units
			{
				//--- Injured animation
				if (animationState _x != "acts_InjuredLyingRifle02") then {
					_x switchMove "acts_InjuredLyingRifle02";
				};

				//--- Disable collision
				//player disableCollisionWith _x;
				//[[player, _x], "disableCollisionWith", _x] call GTA_fnc_remoteExec;
				sleep 0.1;
			} forEach GTA_revive_units;
			sleep 10;
		};
	};

	//--- Event handlers
	player addEventHandler ["Killed", GTA_fnc_reviveOnKilled];
	player addEventHandler ["Respawn", {_this spawn GTA_fnc_reviveOnRespawn}];
};
