private ["_brokenVehicles","_broken"];

params [
	["_vehicle",objNull,[objNull]],
	["_type",0,[0]]
];

if(isNull _vehicle)exitWith{};

_brokenVehicles = ["C_Offroad_01_F","C_Offroad_02_unarmed_F","O_G_Offroad_01_armed_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_T_VTOL_01_armed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F","B_T_LSV_01_unarmed_F","B_T_LSV_01_armed_F","O_T_LSV_02_unarmed_F","O_T_LSV_02_armed_F"];
_broken = if((typeOf _vehicle) in _brokenVehicles)then{true}else{false};

switch(_type)do {
	case 0: {player action ["GetInDriver",_vehicle];}; //Driver
	case 1: {if(_broken)then{player moveInCargo _vehicle;}else{player action ["GetInCargo",_vehicle];};}; //Cargo
	case 2: {if(_broken)then{player moveInGunner _vehicle;}else{player action ["GetInGunner",_vehicle];};}; //Gunner
	case 3: {if(_broken)then{player moveInCommander _vehicle;}else{player action ["GetInCommander",_vehicle];};}; //Commander
};