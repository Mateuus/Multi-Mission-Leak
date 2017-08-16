/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the players settings
*/

tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_addon_disable = true;

[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		if(vehicle player != _recorded OR !alive player) then {
			[] call life_fnc_updateViewDistance;
		};
		sleep 2.2;
	};
};