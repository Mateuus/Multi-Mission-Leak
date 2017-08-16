/*
	File: fn_createVehicle.sqf
	Author: Skalicon

	Description:
	Spawns and sets up a vehicle
*/
private["_veh","_vehicle","_plate","_color","_sp","_dir","_plate","_player"];
_veh = _this select 0;
_color = _this select 1;
_sp = _this select 2;
_dir = _this select 3;
_plate = _this select 4;
_player = _this select 5;
_alarm = [_this,6,false,[false]] call BIS_fnc_param;
_pid = getPlayerUID _player;
//Create vehicle
//_vehicle = _veh createVehicle _sp;
_vehicle = createVehicle [_veh, _sp, [], 0, "CAN_COLLIDE"];
_vehicle setVariable ["BIS_randomSeed1", 0, TRUE];
_vehicle allowDamage false;
[_vehicle] spawn {
	_vehicle = _this select 0;
	sleep 10;
	_vehicle allowDamage true;
};

if (_vehicle isKindOf "Ship") then { _vehicle setPosASL _sp; }
else { _vehicle setPosATL _sp; };
_vehicle setDir _dir;

//Set Vehicle color
[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn BIS_fnc_MP;

_side = switch (side _player) do
{
	case west: { "cop" };
	case independent: { "med" };
	default { "civ" };
};

//Set Vehicle data
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["vehicle_info_owners",[[_pid,name _player]],true];
//_vehicle setVariable["spawned",true,true];
//_vehicle setVariable["idleTime",time,true];
_vehicle setVariable["dbInfo",[_pid,_plate,_player,_alarm,_side],true];
_vehicle addEventHandler["Killed", {_this spawn ASY_fnc_vehicleDead;}];
_vehicle addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];
_vehicle addEventHandler["GetIn", {_this call life_fnc_vehicleEnter;}];
if (X_Server) then { 
	[_vehicle,{_this addEventHandler["handleDamage",{_this call life_fnc_handleVehicleDamage}]; if(67 in life_talents) then {_this addItemCargoGlobal ["ToolKit",2]; _this addBackpackCargoGlobal ["B_AssaultPack_cbr",1]}}] remoteExecCall ["BIS_fnc_call",_player]; 
} else { 
	_vehicle addEventHandler["handleDamage",{_this call life_fnc_handleVehicleDamage;}]; 
	if(67 in life_talents) then {_vehicle addItemCargoGlobal ["ToolKit",2]; _vehicle addBackpackCargoGlobal ["B_AssaultPack_cbr",1]};
};
_vehicle lock 2;
_vehicle enableRopeAttach false;
[_vehicle,"ASY_fnc_setIdleTime",false,false] spawn life_fnc_MP;

_animate = "";
//Set vehicle animation
if(side _player == civilian) then
{
	if(_veh == "C_Offroad_01_F") then { _animate = "civ_offroad"; };
};	
if(side _player == west) then
{
	if(_veh in ["C_Offroad_01_F","B_G_Offroad_01_armed_F"]) then { _animate = "cop_offroad"; };
	if(_veh == "C_SUV_01_F") then { _animate = "cop_suv"; };
	if(_veh == "B_MRAP_01_F") then { _animate = "cop_hunter"; };
	if(_veh == "I_Plane_Fighter_03_CAS_F") then { _animate = "cop_buzzard"; };
	if(_veh == "C_Hatchback_01_sport_F") then { _animate = "cop_sport"; };
	//life_tracked set [count life_tracked, _vehicle];
};
if(side _player == independent) then
{
	if(_veh == "C_Offroad_01_F") then { _animate = "med_offroad"; };
	if(_veh == "C_SUV_01_F") then { _animate = "med_suv"; };
};

if (!isNil "life_veh_shop") then
{
	if((life_veh_shop == "civ_air") && (typeOf _vehicle in ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F"])) then{_animate = "civ_littlebird";};
	if((life_veh_shop == "med_air") && (typeOf _vehicle == "B_Heli_Light_01_F")) then{_animate = "med_littlebird";};
	if((life_veh_shop == "reb_air") && (typeOf _vehicle == "B_Heli_Light_01_F") && _color == 13) then{_animate = "reb_littlebird";};
};
	
if (_animate != "") then
{
	[[_vehicle,_animate,true],"life_fnc_vehicleAnimate",false,false] spawn life_fnc_MP;
	[_vehicle,_animate,true] spawn life_fnc_vehicleAnimate;
};

[[_vehicle],"ASY_fnc_igiInit",false,false] spawn life_fnc_MP;
_vehicle disableTIEquipment true;

/*if (side _player == west && life_coprole == "detective") then
{
	_vehicle addWeaponCargoGlobal ["SMG_01_ACO_F",1];
	_vehicle addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 4];
	_vehicle addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01_tracer_green", 3];
};*/

[[_vehicle],"ASY_fnc_addVehicle2Chain",_player,false] spawn life_fnc_MP;
_vehicle;