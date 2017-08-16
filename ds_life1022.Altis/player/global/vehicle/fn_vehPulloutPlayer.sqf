/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Pulls crew out of vehicle
*/

private ["_vehicle"];

if(isNull objectParent player)exitwith{};

_vehicle = (vehicle player);
if(speed(_vehicle) > 5)exitwith {};
if(player distance (_this select 1) > 10)exitwith {};

if(player getVariable ["restrained",false])then
	{
	detach player;
	player setVariable["escorted",false,true];
	};

player action ["GetOut",_vehicle];
titleText ["You have been pulled out of the vehicle","PLAIN"];
titleFadeOut 4;