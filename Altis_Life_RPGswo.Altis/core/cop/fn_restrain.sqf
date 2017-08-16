#include "..\..\macros.hpp"
/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_unit","_player","_cop","_vehicle"];
_unit = param [0,ObjNull,[ObjNull]];
_player = player;
_vehicle = vehicle player;
if(isNull _unit) exitWith {};

titleText[format["Du wurdest von %1 festgenommen.",getPlayerName(_unit)],"PLAIN"];

[getPlayerUID _player,1, side _player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	

DWEV_disable_getIn = true;
DWEV_disable_getOut = false;
			
while {player getVariable "restrained"} do
{
	if(vehicle player == player) then 
	{
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
		[getPlayerUID _player,0, side _player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	
	};

	if(vehicle player != player && DWEV_disable_getIn) then
	{
		moveOut player;
	};
	
	if((vehicle player != player) && (vehicle player != _vehicle)) then
	{
		_vehicle = vehicle player;
	};
	
	if(vehicle player == player && DWEV_disable_getOut) then
	{
		player moveInCargo _vehicle; 
	};
	
	if((vehicle player != player) && DWEV_disable_getOut && (driver (vehicle player) == player)) then
	{
		player action["eject",vehicle player];
		player moveInCargo _vehicle;
	};
};
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	[getPlayerUID _player,0, side _player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen
	detach player;
	titleText["Dir wurden die Handschellen abgenommen, du kannst dich nun frei bewegen.","PLAIN"];
	player say3D "cuff";
};