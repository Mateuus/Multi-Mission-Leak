/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(playerSide == west OR (vehicle player == player)) exitWith {};
if((player getVariable "restrained") OR (player getVariable "restrainedciv")) then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	player setVariable["Escortingciv",false,true];
	player setVariable["transportingciv",false,true];
};

player action ["Eject", vehicle player];
titleText["Sie wurden aus dem Fahrzeug herausgezogen","PLAIN"];
titleFadeOut 4;