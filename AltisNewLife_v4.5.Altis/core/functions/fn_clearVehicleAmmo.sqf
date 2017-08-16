private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
_veh = typeOf _vehicle;
if(_veh == "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle removeweapon "GMG_40mm";
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt_Tracer_Red",[0]];
	_vehicle removeweapon "LMG_Minigun";
};
//KajMan Mi-48
if(_veh == "O_Heli_Attack_02_F") then
{
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
	_vehicle removeweapon "gatling_30mm";
	_vehicle removeweapon "rockets_Skyfire";
	_vehicle removeweapon "missiles_SCALPEL";
};
//KajMan Mi-48
if(_veh == "O_Heli_Attack_02_black_F") then
{
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
	_vehicle removeweapon "gatling_30mm";
	_vehicle removeweapon "rockets_Skyfire";
	_vehicle removeweapon "missiles_SCALPEL";
};
//GohstHawk UH-80
if (_veh == "B_Heli_Transport_01_F")then
{
	//_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[0]];
	//_vehicle removeweapon "LMG_Minigun_Transport";
	//_vehicle removeweapon "LMG_Minigun_Transport2";
};
if (_veh == "B_Heli_Transport_01_camo_F") then
{
	//_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[0]];
	//_vehicle removeweapon "LMG_Minigun_Transport";
	//_vehicle removeweapon "LMG_Minigun_Transport2";
};
// BlackFoot AH-99
if(_veh == "B_Heli_Attack_01_F") then
{
	_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
	_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
	_vehicle removeweapon "gatling_20mm";
	_vehicle removeweapon "missiles_DAGR";
	_vehicle removeweapon "missiles_ASRAAM";
};
// Hellcat WY-55 
if(_veh == "I_Heli_light_03_F") then
{
	_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[0]];
	_vehicle removeweapon "M134_minigun";
	_vehicle removeweapon "missiles_DAR";
};
// Marid MSE-3
if(_veh == "O_APC_Wheeled_02_rcws_F") then
{
	_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
	_vehicle removeweapon "GMG_40mm";
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;