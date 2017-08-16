/*
v1g Fast Rope by [STELS]Zealot
Modified by ArmA.Network
*/
#define MAX_SPEED_WHILE_FASTROPING 5
#define MAX_SPEED_ROPES_AVAIL 15

#define STR_TOSS_ROPES "Toss Ropes"
#define STR_FAST_ROPE "Fast Rope"
#define STR_CUT_ROPES "Cut Ropes"

if (isDedicated) exitWith {};
waitUntil {player == player};

zlt_rope_ropes = [];
zlt_mutexAction = false;

zlt_rope_helis = [
	"B_Heli_Light_01_F",
	"max_HEMS_heli",
	"O_Heli_Light_02_unarmed_F",
	"sab_UN_Heli",
	"sab_UN_Large_Heli",
	"sab_UN_bird_civil",
	"sab_UN_bird",
	"sab_UN_Taru",
	"sab_UN_attackHeli",
	"B_Heli_Transport_03_F",
	"B_Heli_Transport_01_F"
];

zlt_fnc_tossropes = {
	private ["_heli","_ropes","_oropes","_rope"];
	_heli = _this;
	_ropes = [];
	_oropes = _heli getvariable ["zlt_ropes",[]];
	if (count _oropes != 0 ) exitwith {};
	sleep random 0.3;
	if ( count (_heli getvariable ["zlt_ropes",[]]) != 0 ) exitwith { zlt_mutexAction = false; };
	_heli animateDoor ['door_R', 1];
	_heli animateDoor ['door_L', 1];
	_rope = ropeCreate [vehicle player, "slingload0", (getPosATL player select 2) + 3, (getPosATL player select 2) + 3, true];
	_oropes = _oropes + [_rope];
	_heli setvariable ["zlt_ropes",_oropes,true];

	_heli spawn {
		private ["_heli","_ropes"];
		_heli = _this;
		while {alive _heli and count (_heli getvariable ["zlt_ropes", []]) != 0 and abs (speed _heli) < MAX_SPEED_ROPES_AVAIL } do {
			sleep 0.3;
		};
		_ropes = (_heli getvariable ["zlt_ropes", []]);
		{ropeDestroy _x} foreach _ropes;
		_heli setvariable ["zlt_ropes", [], true];
	};
};

zlt_fnc_ropes_cond = {
	_veh = vehicle player;
	_flag = (_veh != player) and {(not zlt_mutexAction)} and {count (_veh getvariable ["zlt_ropes", []]) == 0} and { (typeof _veh) in zlt_rope_helis } and {alive player and alive _veh and (abs (speed _veh) < MAX_SPEED_ROPES_AVAIL ) } and {(player == driver _veh) and ((getPosATL _veh) select 2) > 2};
	_flag;
};

zlt_fnc_fastrope = {
	zlt_mutexAction = true;
	sleep rANDom 0.3;
	player call zlt_fnc_fastropeUnit;
	zlt_mutexAction = false;
};

zlt_fnc_fastropeUnit = {
	_unit = _this;
	_veh = vehicle _unit;
	_ropes = (_veh getvariable ["zlt_ropes", []]);
	if (count _ropes == 0) exitwith {};
	_unit action ["EJECT",_veh];
	unassignVehicle _unit;
	_ropePos = ropeEndPosition (_ropes select 0) select 0;
	_unit setPos [(_ropePos select 0),(_ropePos select 1),(_ropePos select 2)-2];
	_unit switchMove "LadderRifleStatic";
	_unit setDir (getDir _veh - 90);
	While {Alive _unit && (((getPos _unit) select 2) > 1.5)} do
	{
		_unit switchMove "LadderRifleStatic";
	};
	_unit setVelocity [0,0,0];
	_unit playMove "LadderRifleDownOff";
};

zlt_fnc_cutropes = {
	_veh = _this;
	_ropes = (_veh getvariable ["zlt_ropes", []]);
	{ropeDestroy _x} foreach _ropes;
	_veh setvariable ["zlt_ropes", [], true];
	_veh animateDoor ['door_R', 0];
	_veh animateDoor ['door_L', 0];
};

zlt_fnc_removeropes = {
	(vehicle player) call zlt_fnc_cutropes;
};

zlt_fnc_createropes = {
	zlt_mutexAction = true;
	(vehicle player) call zlt_fnc_tossropes;
	zlt_mutexAction = false;
};

player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','([] call zlt_fnc_ropes_cond)'];
player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0'];
player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player && !(player getVariable "transporting") && !(player getVariable "restrained")'];

player addEventHandler ["Respawn", {
	player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','([] call zlt_fnc_ropes_cond)'];
	player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0'];
	player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player && !(player getVariable "transporting") && !(player getVariable "restrained")'];
}];
