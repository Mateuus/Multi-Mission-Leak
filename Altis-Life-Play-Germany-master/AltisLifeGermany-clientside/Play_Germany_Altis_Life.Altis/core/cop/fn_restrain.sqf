#include <macro.h>
/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
PG_autoUnrestrained = false;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn {
	private "_time";
	while {true} do {
	
		uiSleep 300;
		
		if(!(player GVAR ["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player GVAR ["restrained",FALSE]) && vehicle player == player) exitWith {
			player SVAR ["restrained",FALSE,TRUE];
			player SVAR ["Escorting",FALSE,TRUE];
			player SVAR ["transporting",false,true];
			PG_autoUnrestrained = true;
			detach player;
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
		};
	};
};

if((player GVAR["surrender",FALSE])) then { player SVAR["surrender",FALSE,TRUE]; player switchMove ""; };

titleText[localize "STR_Cop_Retrained","PLAIN"];

player say3D "handcuffs";

while {player GVAR  "restrained"} do {
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith {
		player SVAR ["restrained",false,true];
		player SVAR ["Escorting",false,true];
		player SVAR ["transporting",false,true];
		detach _player;
	};
	
	if(vehicle player != player) then {
		if(driver (vehicle player) == player) then {player moveInCargo (vehicle player);};
	};
};

if(alive player && !PG_autoUnrestrained) then {
	titleText["Du wurdest freigelassen.","PLAIN"];
	player switchMove "";
	player SVAR ["Escorting",false,true];
	player SVAR ["transporting",false,true];
	detach player;
};