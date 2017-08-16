/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(vehicle player == player) exitWith {};

if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	DWEV_disable_getOut = false;
	player action ["Eject", vehicle player];
	titleText["Du wurdest aus dem Fahrzeug gezogen.","PLAIN"];
	titleFadeOut 4;
	DWEV_disable_getIn = true;
}
else
{
	player action ["Eject", vehicle player];
	moveOut player;
	titleText["Du wurdest aus dem Fahrzeug gezogen.","PLAIN"];
	titleFadeOut 4;
};