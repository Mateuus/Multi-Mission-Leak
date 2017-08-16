/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

life_gang_ranks =
[
	[
		0, // Level
		"Recruit", // Name
		false, // Can kick
		false, // Can rank up players
		false, // Can use gang funds
		false, // Can upgrade
		false, // Can build on gang plot
		false // Can invite
	],
	[
		1, // Level
		"Private", // Name
		false, // Can kick
		false, // Can rank up players
		false, // Can use gang funds
		false, // Can upgrade
		false, // Can build on gang plot
		false // Can invite
	],
	[
		2, // Level
		"Sergeant", // Name
		false, // Can kick
		false, // Can rank up players
		false, // Can use gang funds
		false, // Can upgrade
		true, // Can build on gang plot
		true // Can invite
	],
	[
		3, // Level
		"Captain", // Name
		false, // Can kick
		false, // Can rank up players
		true, // Can use gang funds
		true, // Can upgrade
		true, // Can build on gang plot
		true // Can invite
	],
	[
		4, // Level
		"Major", // Name
		false, // Can kick
		true, // Can rank up players
		true, // Can use gang funds
		true, // Can upgrade
		true, // Can build on gang plot
		true // Can invite
	],
	[
		5, // Level
		"General", // Name
		true, // Can kick
		true, // Can rank up players
		true, // Can use gang funds
		true, // Can upgrade
		true, // Can build on gang plot
		true // Can invite
	]
	// No need for another rank for leader, they can do everything.
];

life_gang_plot_rank = 5;
life_gang_price = 7500;
life_gang_upgrade = 5000;


__CONST__(life_gang_ranks, life_gang_ranks);
__CONST__(life_gang_price, life_gang_price);
__CONST__(life_gang_upgrade, life_gang_upgrade);



/** Helpers **/
life_fnc_gangGetUpgradePrice = {
	_currentRank = param [0,0,[0]];

	_costs = 0;
	_maxMembers = 6 + (_currentRank - 1) * 2;
	// Steep incline in price to level 5, after that it falls off quickly.
	if (_currentRank <= 5) then {
		_costs = (call life_gang_upgrade) * _currentRank * _maxMembers;
	} else {
		_costs = (call life_gang_upgrade) * (_maxMembers * 2);
	};

	_costs;
};


life_fnc_gangGetRank = {
	private["_return", "_level"];
	_return = [];
	_level = param [0,0,[0]];

	{
		if (_x select 0 == _level) exitWith { _return = _x };
	} forEach (call life_gang_ranks);
	_return;
};

life_fnc_gangIsAllowed = {
	private["_playerLevel"];

	_permission = param [0,0,[-1]];
	if (_permission == -1) exitWith { false; };

	_playerLevel = player getVariable["gangRank", -1];
	if (_playerLevel == -1) exitWith { false; };

	_rank = [_playerLevel] call life_fnc_gangGetRank;

	switch (_permission) do {
		case 1:
		{
			// Kick
			(_rank select 2 == true);
		};

		case 2:
		{
			// Rank up players
			(_rank select 3 == true);
		};

		case 3:
		{
			// Gang funds
			(_rank select 4 == true);

		}:

		case 4:
		{
			// Upgrade
			(_rank select 5 == true);
		};

		case 5:
		{
			// Build on gang plot
			(_rank select 6 == true);
		};
	};

	false;
};
