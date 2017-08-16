/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Pulls crew out of vehicle
*/

private ["_vehicle","_speed"];

_vehicle = (vehicle player);
if(_vehicle == player)exitwith{};

if(player getVariable "cuffed")then
	{
	detach player;
	player setVariable["cuffedVeh",false,true];
	player setVariable["Escorted",false,true];
	};
	
player action ["getOut", _vehicle];
titleText ["You have been pulled out of the vehicle","PLAIN"];
titleFadeOut 4;





