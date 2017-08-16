#include "..\..\script_macros.hpp"
/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the client.
*/
private["_cop","_player","_vehicle"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
_vehicle = vehicle player;
if(isNull _cop) exitWith {};

titleText[format[localize "STR_Cop_Retrained",_cop GVAR ["realname",name _cop]],"PLAIN"];

life_disable_getIn = true;
life_disable_getOut = false;

while {player GVAR  "restrained"} do {
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player GVAR "restrained") || vehicle player != _state};

	if(!alive player) exitWith {
		player SVAR ["restrained",false,true];
		player SVAR ["masked",false,true];
		player SVAR ["Escorting",false,true];
		player SVAR ["transporting",false,true];
		detach _player;
	};

	if(!alive _cop) then {
		player SVAR ["Escorting",false,true];
		detach player;
	};
	
	/*
	if(vehicle player != player) then {
		if (life_disable_getIn) then {
			player action["eject",vehicle player];
		};
	};
	*/

	if(vehicle player != player) then {
		if (vehicle player != _vehicle) then {
			_vehicle = vehicle player;
		};
	};

	if(vehicle player == player) then {
		if (life_disable_getOut) then {
			player moveInCargo _vehicle;
		};
	};

	if(vehicle player != player) then {
		if (life_disable_getOut) then {
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player];
				player moveInCargo _vehicle;
			};
		};
	};
};

//disableUserInput false;

if(alive player) then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player SVAR ["Escorting",false,true];
	player SVAR ["transporting",false,true];
	detach player;
};
