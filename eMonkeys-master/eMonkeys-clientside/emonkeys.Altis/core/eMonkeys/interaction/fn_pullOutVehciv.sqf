/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(vehicle player == player)) exitWith {};
if(player getVariable "restrainedciv") then
{
	detach player;
	player setVariable["Escortingciv",false,true];
	player setVariable["transportingciv",false,true];
};

player action ["Eject", vehicle player];
titleText["Sie wurden aus dem Fahrzeug herausgezogen","PLAIN"];
titleFadeOut 4;