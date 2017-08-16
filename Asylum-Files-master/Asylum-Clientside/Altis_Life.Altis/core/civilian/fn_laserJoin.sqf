/*
	File: fn_initJoin.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player wishes to join laser tag queue for next game.
*/

if (playerSide != civilian) exitWith { hint "You can't play laser tag while on duty! GET TO WORK!"; };

hint "You have joined the laser tag queue.  The next game will start any time within the next few minutes.  Stay nearby or joining will fail!";
player setVariable ["life_laser_pos", getPos player, true];
life_old_group = group player;

[[player],"ASY_fnc_laserQueue",false,false] spawn life_fnc_MP;