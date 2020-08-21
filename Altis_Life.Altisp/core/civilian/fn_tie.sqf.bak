#include "..\..\script_macros.hpp"
/*
	File: fn_tie.sqf

	Description:
	Tie the client.
*/
private["_civ","_player","_vehicle","_turrets"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
_vehicle = vehicle player;
if(isNull _civ) exitWith {};
if((player GVAR ["playerSurrender",FALSE])) then { player SVAR ["playerSurrender",FALSE,TRUE]; player switchMove ""; };

//Monitor excessive restrainment
[] spawn {
	private "_time";
	for "_i" from 0 to 1 step 0 do {
		_time = time;
		waitUntil {(time - _time) > (10 * 60)};

		if(!(player GVAR ["tied",FALSE])) exitWith {};
		if(!([civilian,getPos player,30] call life_fnc_nearUnits) && (player GVAR ["tied",FALSE]) && vehicle player == player) exitWith {
			player SVAR ["tied",FALSE,TRUE];
			player SVAR ["restrained",FALSE,TRUE];
			player SVAR ["Escorting",FALSE,TRUE];
			player SVAR ["transporting",false,true];
			detach player;
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
		};
	};
};

if((player GVAR ["playerSurrender",FALSE])) then { player SVAR ["playerSurrender",FALSE,TRUE]; player switchMove ""; };

titleText[format[localize "STR_Cop_Restrained",_civ GVAR ["realname",name _civ]],"PLAIN"];

life_disable_getIn = true;
life_disable_getOut = false;

while {player GVAR "tied"} do {
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player GVAR "tied") || vehicle player != _state};

	if(!alive player) exitWith {
		player SVAR ["tied",false,true];
		player SVAR ["restrained",false,true];
		player SVAR ["Escorting",false,true];
		player SVAR ["transporting",false,true];
		detach _player;
	};

	if(!alive _civ) then {
		player SVAR ["Escorting",false,true];
		detach player;
	};

	if(vehicle player != player && life_disable_getIn) then {
		player action["eject",vehicle player];
	};

	if((vehicle player != player) && (vehicle player != _vehicle)) then {
		_vehicle = vehicle player;
	};

	if(vehicle player == player && life_disable_getOut) then {
		player moveInCargo _vehicle;
	};

	if(vehicle player != player && life_disable_getOut) then {
		_turrets = [[-1]] + allTurrets _vehicle;
		{
			if (_vehicle turretUnit [_x select 0] == player) then {
				player action["eject",vehicle player];
				player moveInCargo _vehicle;
			};
		}forEach _turrets;
	};

	if((vehicle player != player) && life_disable_getOut && (driver (vehicle player) == player)) then {
		player action["eject",vehicle player];
		player moveInCargo _vehicle;
	};
};

//disableUserInput false;

if(alive player) then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player SVAR ["Escorting",false,true];
	player SVAR ["transporting",false,true];
	detach player;
};