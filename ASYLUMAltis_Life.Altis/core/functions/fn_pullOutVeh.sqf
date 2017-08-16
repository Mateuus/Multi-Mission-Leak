/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;

if(playerSide == west OR (vehicle player == player)) exitWith {};
if(player getVariable ["restrained",false]) then
{
	detach player;
	player setVariable["Escorting",nil,true];
	player setVariable["transporting",nil,true];
};

player action ["Eject", vehicle player];
player action ["GetOut", vehicle player];

waitUntil {vehicle player == player};
titleText["You have been pulled out of the vehicle","PLAIN"];
titleFadeOut 4;