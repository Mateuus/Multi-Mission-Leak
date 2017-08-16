/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- TODO: Handle using 'put' and 'take' event handlers

[] spawn {
	private ["_uniform", "_vest", "_backpack"];

	while {true} do {
		_uniform = uniform player;
		_vest = vest player;
		_backpack = backpack player;

		//--- Refresh
		[] call GTA_fnc_refreshVirtualInventoryMaxLoad;

		waitUntil {uniform player != _uniform || {vest player != _vest} || {backpack player != _backpack}};
	};
};

//--- TODO: Implement into new survival system
[] spawn {

	while { true } do {

		sleep 1.5;

		if ( life_carryWeight > life_maxWeight && !isForcedWalk player ) then {

			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";

		} else {

			if ( isForcedWalk player ) then {

				player forceWalk false;

			};

		};

	};

};

//--- TODO: Rework into new survival system
/*[] spawn {

	while { true } do {
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {

			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};

		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;

		sleep 1;
	};
};*/
