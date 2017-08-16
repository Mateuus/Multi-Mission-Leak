/*
fastrope.sqf made by UNKNOWN
Editted to work on Altis Life 4.0 by TheRick
+ Edits of RPGforYOU
*/

#define MAX_ALTITUDE_ROPES_AVAIL 70
#define MIN_ALTITUDE_ROPES_AVAIL 5
#define MAX_SPEED_ROPES_AVAIL 50

#define STR_TOSS_ROPES "Toss Ropes"
#define STR_FAST_ROPE "Fast Rope"
#define STR_CUT_ROPES "Cut Ropes"

if (isDedicated) exitWith {};
waitUntil {player isEqualTo player};

zlt_rope_ropes = [];
zlt_mutexAction = false;

zlt_rope_helis = ["B_Heli_Transport_01_camo_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","B_CTRG_Heli_Transport_01_sand"];

zlt_fnc_tossropes = {
	private ["_heli","_ropes","_oropes","_rope"];
	_heli = _this;
	_ropes = [];
	_oropes = _heli getVariable ["zlt_ropes",[]];
	if (count _oropes != 0 ) exitWith {};
	random 0.3;
	if ( count (_heli getVariable ["zlt_ropes",[]]) != 0 ) exitWith { zlt_mutexAction = false; };
	switch (typeOf _heli) do {
		case "B_Heli_Transport_01_camo_F": {
			_heli animateDoor ['door_R', 1];
			_heli animateDoor ['door_L', 1];
		};
		case "I_Heli_Transport_02_F": {
		};
		case "I_Heli_light_03_unarmed_F": {
		};
		case "B_CTRG_Heli_Transport_01_sand": {
			_heli animateDoor ['door_R', 1];
			_heli animateDoor ['door_L', 1];
		};
	};
	_rope = ropeCreate [vehicle player, "slingload0", (getPosATL player select 2) + 3, (getPosATL player select 2) + 3, true];
	_oropes = _oropes + [_rope];
	_heli setVariable ["zlt_ropes",_oropes,true];
	
	_heli spawn {
		private ["_heli","_ropes"];
		_heli = _this;
		while {alive _heli AND count (_heli getVariable ["zlt_ropes", []]) != 0 AND abs (speed _heli) < MAX_SPEED_ROPES_AVAIL } do {
			uiSleep 0.3;
		};
		_ropes = (_heli getVariable ["zlt_ropes", []]);
		{deletevehicle _x} forEach _ropes;
		_heli setVariable ["zlt_ropes", [], true];
	};
};

zlt_fnc_ropes_cond = {
	_veh = vehicle player;
	_flag = (_veh != player) AND (player isequalto driver vehicle player) AND ((getPos (_veh) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND ((getPos (_veh) select 2) > MIN_ALTITUDE_ROPES_AVAIL) AND {(not zlt_mutexAction)} AND !(player getVariable "restrained") AND {count (_veh getVariable ["zlt_ropes", []]) isequalto 0} AND { (typeOf _veh) in zlt_rope_helis } AND {alive player AND alive _veh AND (abs (speed _veh) < MAX_SPEED_ROPES_AVAIL ) };
	_flag;
};

zlt_fnc_fastrope = {
	zlt_mutexAction = true;
	uiSleep rANDom 0.3;
	player call zlt_fnc_fastropeUnit;
	zlt_mutexAction = false;
};

zlt_fnc_fastropeUnit = {
	_veh = vehicle player;
	_ropes = (_veh getVariable ["zlt_ropes", []]);
	if (count _ropes isequalto 0) exitWith {};
	player action ["Eject",vehicle player];
	uiSleep 0.5;
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
	_ropes = (_veh getVariable ["zlt_ropes", []]);
	{deletevehicle _x} forEach _ropes;
	_veh setVariable ["zlt_ropes", [], true];
	
	switch (typeOf _veh) do {
		case "B_Heli_Transport_01_camo_F": {
			_veh animateDoor ['door_R', 0];
			_veh animateDoor ['door_L', 0];
		};
		case "B_CTRG_Heli_Transport_01_sand": {
			_veh animateDoor ['door_R', 0];
			_veh animateDoor ['door_L', 0];
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

player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction AND count ((vehicle player) getVariable ["zlt_ropes", []]) != 0 && !(player getVariable "restrained")'];
player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 6, false, false, '','not zlt_mutexAction AND count ((vehicle player) getVariable ["zlt_ropes", []]) != 0 AND ((getPos (vehicle player) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND  player != driver vehicle player && !(player getVariable "restrained")'];

player addEventHandler ["Respawn", {
	player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
	player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction AND count ((vehicle player) getVariable ["zlt_ropes", []]) != 0 && !(player getVariable "restrained")'];
	player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 6, false, false, '','not zlt_mutexAction AND count ((vehicle player) getVariable ["zlt_ropes", []]) != 0 AND ((getPos (vehicle player) select 2) < MAX_ALTITUDE_ROPES_AVAIL) AND player != driver vehicle player && !(player getVariable "restrained")'];
}];