#include "..\..\script_macros.hpp"
/*
fastrope.sqf made by UNKNOWN
Editted to work on Altis Life 4.0 by TheRick
*/

#define MAX_ALTITUDE_ROPES_AVAIL 70
#define MIN_ALTITUDE_ROPES_AVAIL 5
#define MAX_SPEED_ROPES_AVAIL 50

#define STR_TOSS_ROPES "Toss Ropes"
#define STR_FAST_ROPE "Fast Rope"
#define STR_CUT_ROPES "Cut Ropes"

if (isDedicated) exitWith {};
waitUntil {player == player};

zlt_rope_ropes = [];
zlt_mutexAction = false;

zlt_rope_helis = ["O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F"];

zlt_fnc_tossropes = {
	private ["_heli","_ropes","_oropes","_rope"];
	_heli = _this;
	_ropes = [];
	_oropes = _heli GetVariable ["zlt_ropes",[]];
	if (count _oropes != 0 ) exitWith {};
	random 0.3;
	if ( count (_heli GetVariable ["zlt_ropes",[]]) != 0 ) exitWith { zlt_mutexAction = false; };
	switch (typeOf _heli) do {
		case "O_Heli_Light_02_unarmed_F": {};

		case "I_Heli_Transport_02_F": {
			_heli animateDoor ['Door_Back_L', 1];
			_heli animateDoor ['Door_Back_R', 1];
		};

		case "B_Heli_Transport_01_F": {
			_heli animateDoor ['door_R', 1];
			_heli animateDoor ['door_L', 1];
		};

		case "B_Heli_Transport_03_unarmed_F": {
			_heli animateDoor ['Door_R_source', 1];
			_heli animateDoor ['Door_L_source', 1];
		};
	};
	_rope = ropeCreate [vehicle player, "slingload0", (getPosATL player select 2) + 3, (getPosATL player select 2) + 3, true];
	_oropes = _oropes + [_rope];
	_heli SetVariable ["zlt_ropes",_oropes,true];

	_heli spawn {
		private ["_heli","_ropes"];
		_heli = _this;
		while {alive _heli AND count (_heli GetVariable ["zlt_ropes", []]) != 0 AND abs (speed _heli) < MAX_SPEED_ROPES_AVAIL } do {
			sleep 0.3;
		};
		_ropes = (_heli GetVariable ["zlt_ropes", []]);
		{ropeDestroy _x} forEach _ropes;
		_heli SetVariable ["zlt_ropes", [], true];
	};

};

zlt_fnc_ropes_cond = {
	_veh = vehicle player;
	_flag = (_veh != player) AND (playerSide isEqualTo west) AND (player isEqualTo driver vehicle player) AND ((getPos (_veh) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND ((getPos (_veh) select 2) > MIN_ALTITUDE_ROPES_AVAIL) AND {(not zlt_mutexAction)} AND !(player GetVariable "restrained") AND {count (_veh GetVariable ["zlt_ropes", []]) isEqualTo 0} AND { (typeOf _veh) in zlt_rope_helis } AND {alive player AND alive _veh AND (abs (speed _veh) < MAX_SPEED_ROPES_AVAIL ) };
	_flag;
};

zlt_fnc_fastrope = {
	zlt_mutexAction = true;
	sleep rANDom 0.3;
	player call zlt_fnc_fastropeUnit;
	zlt_mutexAction = false;
};

zlt_fnc_fastropeUnit = {
	_veh = vehicle player;
	_ropes = (_veh GetVariable ["zlt_ropes", []]);
	if (count _ropes isEqualTo 0) exitWith {};
	player action ["Eject",vehicle player];
	sleep 0.5;
	player leaveVehicle _veh;
    moveOut player;
	player allowDamage false;
	_ropePos = ropeEndPosition (_ropes select 0) select 0;
	player setPosATL [(getPosATL _veh select 0),(getPosATL _veh select 1),(getPosATL _veh select 2)-0.5];
	player switchMove "LadderRifleStatic";
	player setDir (getDir _veh - 90);
	While {Alive player && (((getPos player) select 2) > 1.5)} do
	{
		player switchMove "LadderRifleStatic";
	};
	player setVelocity [0,0,0];
	player playMove "LadderRifleDownOff";
	player allowDamage true;
};

zlt_fnc_cutropes = {
	_veh = _this;
	_ropes = (_veh GetVariable ["zlt_ropes", []]);
	{ropeDestroy _x} forEach _ropes;
	_veh SetVariable ["zlt_ropes", [], true];

	switch (typeOf _veh) do {
		case "O_Heli_Light_02_unarmed_F": {};

		case "I_Heli_Transport_02_F": {
			_veh animateDoor ['Door_Back_L', 0];
			_veh animateDoor ['Door_Back_R', 0];
		};

		case "B_Heli_Transport_01_F": {
			_veh animateDoor ['door_R', 0];
			_veh animateDoor ['door_L', 0];
		};

		case "B_Heli_Transport_03_unarmed_F": {
			_veh animateDoor ['Door_R_source', 0];
			_veh animateDoor ['Door_L_source', 0];
		};
	};
};

zlt_fnc_removeropes = {
	(vehicle player) call zlt_fnc_cutropes;
};

zlt_fnc_createropes = {
	zlt_mutexAction = true;
	(vehicle player) call zlt_fnc_tossropes;
	zlt_mutexAction = false;
};

player createDiarySubject [STR_SCRIPTS_NAME,STR_SCRIPTS_NAME];
player createDiaryRecord [STR_SCRIPTS_NAME,[STR_SCRIPT_NAME, STR_HELP]];

player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction AND count ((vehicle player) GetVariable ["zlt_ropes", []]) != 0 AND player isEqualTo driver vehicle player && !(player GetVariable "restrained")'];
player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction AND count ((vehicle player) GetVariable ["zlt_ropes", []]) != 0 AND ((getPos (vehicle player) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND locked vehicle player isEqualTo 0 AND player != driver vehicle player && !(player GetVariable "restrained")'];

player addEventHANDler ["Respawn", {
	player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
	player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction AND count ((vehicle player) GetVariable ["zlt_ropes", []]) != 0 AND player != driver vehicle player && !(player GetVariable "restrained")'];
	player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction AND count ((vehicle player) GetVariable ["zlt_ropes", []]) != 0 AND ((getPos (vehicle player) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND locked vehicle player isEqualTo 0 AND player != driver vehicle player && !(player GetVariable "restrained")'];
}];