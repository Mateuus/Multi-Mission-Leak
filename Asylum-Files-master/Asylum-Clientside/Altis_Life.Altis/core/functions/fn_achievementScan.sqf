/*
	File: fn_achievementScan.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Scans achievement conditions for new matches.
*/

{
	if (!(_forEachIndex in life_achievements)) then
	{
		if (playerSide in (_x select 0) && call compile (_x select 2)) then
		{
			[_forEachIndex] call life_fnc_achievementGrant;
		};
	}
	else
	{
		if (playerSide in (_x select 0) && !(call compile (_x select 2))) then
		{
			life_achievements = life_achievements - [_forEachIndex];
		};
	};
} forEach life_achievementInfo;