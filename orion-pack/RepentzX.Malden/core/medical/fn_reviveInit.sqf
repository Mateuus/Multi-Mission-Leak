
if (isNil "life_revive_units") then {
	if (isServer) then {
		life_revive_units = [];
		publicVariable "life_revive_units";
	} else {
		waitUntil {!isNil "life_revive_units"};
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
				//[[player, _x], "disableCollisionWith", _x] call life_fnc_remoteExec;
				sleep 0.1;
			} forEach life_revive_units;
			sleep 10;
		};
	};

	//--- Event handlers
	player addEventHandler ["Killed", life_fnc_onPlayerKilled];
	//player addEventHandler ["Respawn", {_this spawn life_fnc_reviveOnRespawn}];
};
