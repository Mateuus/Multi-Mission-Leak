private["_texture","_texture1","_texture2","_texture3","_vehicle"];
DisableSerialization;

_vehicle = typeof veh_shop_vehicle;
if(veh_shop_vehicle isKindOf "C_Quadbike_01_black_F") then {{deletevehicle _x} foreach (nearestObjects [getpos veh_shop_vehicle,["Land_PalletTrolley_01_yellow_F","Land_helicopterwheels_01_disassembled_F","Land_portablehelipadlight_01_F","Land_CampingChair_V1_F"],10])};
deletevehicle veh_shop_vehicle;

_pos = [3020.13,12555.4,1.34629];
veh_shop_vehicle = _vehicle createVehicleLocal _pos;
veh_shop_vehicle enablesimulation false;
veh_shop_vehicle allowdamage false;
veh_shop_vehicle setPilotLight true;
veh_shop_vehicle setdir 146.63;
veh_shop_vehicle setposATL _pos;

_vehicle = veh_shop_vehicle;
_index = lbValue[2304,(lbCurSel 2304)];

if(_vehicle isKindOf "B_Plane_CAS_01_F") then {
	_weapons = ["1000Rnd_Gatling_30mm_Plane_CAS_01_F","2Rnd_Missile_AA_04_F","6Rnd_Missile_AGM_02_F","4Rnd_Bomb_04_F","7Rnd_Rocket_04_HE_F","7Rnd_Rocket_04_AP_F","120Rnd_CMFlare_Chaff_Magazine"]; 
	{_vehicle removeMagazinesTurret [_x,[-1]]} foreach _weapons;
};

if(_vehicle isKindOf "C_Quadbike_01_black_F") then {
	_rollator = "Land_PalletTrolley_01_yellow_F" createvehiclelocal (getpos _vehicle);
	_rollatorreifen1 = "Land_helicopterwheels_01_disassembled_F" createvehiclelocal (getpos _vehicle);
	_rollatorreifen2 = "Land_helicopterwheels_01_disassembled_F" createvehiclelocal (getpos _vehicle);
	_rollatorlicht = "Land_portablehelipadlight_01_F" createvehiclelocal (getpos _vehicle);
	_rollatorstuhl = "Land_CampingChair_V1_F" createvehiclelocal (getpos _vehicle);
	_rollatorreifen1 attachto[_vehicle,[0,0.2,-1.3]]; 
	_rollatorreifen2 attachto[_vehicle,[0,-0.9,-1.3]];
	_rollatorreifen2 setdir 180;
	_rollatorlicht attachto [_vehicle,[0,0.3,-0.25]];
	_rollatorstuhl attachto[_vehicle,[0,-0.3,-0.8]]; 
	_rollatorstuhl setdir 180;
	_rollator attachto [_vehicle,[0,-0.3,-0.8]];  
	_rollator setdir 90;
};


if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};

[_vehicle,_index] call life_fnc_colorVehicle;