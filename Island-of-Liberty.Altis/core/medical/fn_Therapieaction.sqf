/*
----------------------------------------------|
Author: Backer
Description: Starts the therapie!
----------------------------------------------|
*/

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

//GIMME MORE

[player] remoteExec ["life_fnc_therapie", _unit];

if(side player == independent) then
{

[0,format["%1 wurde von %2 erfolgreich auf Drogen behandelt!",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]] remoteExec ["life_fnc_broadcast",independent];
};
