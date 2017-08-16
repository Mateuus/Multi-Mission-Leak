/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the players HUD
*/

2 cutRsc ["playerHUD","PLAIN"];

[] call DS_fnc_updateHud;

[] spawn {
	private ["_health"];

	while{true}do {
		_health = (damage player);
		waitUntil {!((damage player) isEqualTo _health)};
		[] call DS_fnc_updateHud;
	};
};