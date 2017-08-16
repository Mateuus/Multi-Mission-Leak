/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(isNull objectParent player) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

_depp = _this select 0;

player action ["GetOut", vehicle player];
titleText[format["Du wurdest von %1 aus dem Fahrzeug gezogen!",_depp],"PLAIN"];
ShowHUD true;
titleFadeOut 4;