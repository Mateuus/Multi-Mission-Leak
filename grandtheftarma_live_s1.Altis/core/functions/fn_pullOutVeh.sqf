/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
// if(playerSide == west OR (vehicle player == player)) exitWith {};

if(vehicle player == player) exitWith {};

if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
player action ["Get Out", vehicle player];
moveOut player;

titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;