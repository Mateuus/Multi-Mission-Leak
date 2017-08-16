_vehicle = vehicle player;

if (_vehicle == player) exitWith {};
if (driver _vehicle != player) exitWith {};

if ((_vehicle getVariable ["nitro",0]) < 1) exitWith {};

if ((speed _vehicle) <= 10) exitWith { ["You must be moving at over 10km/h to activate Nitro.",5,"gray"] call RPG_Fnc_Msg; };
_vehicle setVariable["nitro",((_vehicle getVariable["nitro",0]) - 1),true];
_vehicle setVariable["nitroTime", time, false];
["Nitro Engaged",5,"blue"] call RPG_Fnc_Msg;
[[_vehicle], "life_fnc_nitroSound", true, false] spawn BIS_fnc_MP;
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 20; 
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];

//[_vehicle,"nitro"] spawn life_fnc_nearestSound;