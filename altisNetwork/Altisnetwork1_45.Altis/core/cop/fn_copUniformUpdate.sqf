#include "..\..\script_macros.hpp"
/*
	File: fn_copUniformUpdate.sqf
	Author: RespawnGaming
	Description: Can be used to re-texture cops & hide backpacks etc.
*/
if(playerSide isEqualTo west && {backpack player != ""}) then {
	[unitBackpack player,0,""] remoteExec ["life_fnc_setTexture",RCLIENT];
};