#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retrieves a vehicle from a players garage
*/

private ["_exit","_vehTextureArray","_rebelVehicles","_spawnArray","_pid","_query","_vInfo","_sp","_dir","_pid","_name","_unit","_vehicle","_perkLevel","_specialSpawn","_vid"];

_exit = false;
_pid = (getPlayerUID player);

if(_this select 0)exitwith
	{
	_vid = lbValue[1501,(lbCurSel 1501)];
	_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory FROM vehicles WHERE id='%1' AND pid='%2' AND impounded='0'",_vid,_pid];
	[player,_query,1,_vid,true] remoteExec ["HUNT_fnc_returnVehicleList",2];
	hint "Spawning your vehicle, please wait...";
	};

_vInfo = _this select 1;
_pid = (getPlayerUID player);
_name = (name player);
_unit = player;
closeDialog 0;
_rebelVehicles = ["O_APC_Wheeled_02_rcws_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","B_Heli_Attack_01_F","B_MRAP_01_hmg_F","O_MRAP_02_F","I_MRAP_03_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"];

if((!(playerSide isEqualTo west))&&(DS_AirBan)&&((_vInfo select 2) isKindOf "Air"))then
	{
	_action = [
	"There is currently a region wide flying ban, are you sure you want to risk being shot down on sight by retrieving this vehicle during this time?",
	"Grounded Air Vehicles",
	"Yes FTP",
	"I will Store"
	] call BIS_fnc_guiMessage;
	};

if((playerSide isEqualTo civilian)&&((_vInfo select 2) in ["B_MRAP_01_hmg_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"]))then
	{
	_action = [
	"Make sure you have read and understand the Armed Vehicle rules before using this vehicle.",
	"Armed Vehicle Rules",
	"I Understand",
	"I will store"
	] call BIS_fnc_guiMessage;
	};
DS_vehicleGarage = [];

_sp = (getPos player) findEmptyPosition[20,200,(_vInfo select 2)];

if(isNil "_sp")exitwith{hint "No spawn point was able to be found"};
if(_sp isEqualTo [])exitwith{hint "No spawn point was able to be found"};

_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle"};

_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2)+0.3];
_vehicle allowDamage true;
DS_keyRing pushBack _vehicle;
_vehicle lock 2;
if((_vInfo select 8) > 99)then
	{
	_vehTextureArray = ["extras\textures\vehicles\repaintWeed.jpg","extras\textures\vehicles\repaintChrome.jpg","extras\textures\vehicles\black.paa"];
	_vehTexture = (_vehTextureArray select ((_vInfo select 8) - 100));
	[_vehicle,3,[_vehTexture]] call DS_fnc_globalTexture;
	_vehTextureArray = [];
	}
	else
	{
	_vehTextureArray = [_vInfo select 2,true,playerSide] call DS_fnc_vehicleTextures;
	};
//systemchat format ["Color = %1 || Array = %2",(_vInfo select 8),_vehTextureArray];
if(!(_vehTextureArray isEqualTo []))then
	{
	_vehTexture = (_vehTextureArray select (_vInfo select 8));
	if(count(_vehTexture) > 1)then
		{
		if(count(_vehTexture) > 2)then
			{
			[_vehicle,3,_vehTexture] call DS_fnc_globalTexture;
			}
			else
			{
			[_vehicle,2,_vehTexture] call DS_fnc_globalTexture;
			};
		}
		else
		{
		[_vehicle,1,_vehTexture] call DS_fnc_globalTexture;
		};
	};
_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
[_vehicle,_vInfo] remoteExec ["HUNT_fnc_setupVehicle",2];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7],true];
if((playerSide isEqualTo west)&&(miscInfoArray select 8))then
	{
	_vehicle disableTIEquipment false;
	}
	else
	{
	_vehicle disableTIEquipment true;
	};
_vehicle setVariable ["vehicleTexture",(_vInfo select 8),true];
_vehicle setVariable["sirens",false,true];
_vehicle setVariable ["boot",[[],0]];
_vehicle setVariable["boot_open",false,true];
//_vehicle setVariable ["vehicleTexture",_vehTexture,true];

switch(playerside)do
	{
	case west:
		{
		[_vehicle] spawn DS_fnc_setUpVeh;
		_vehicle setVariable ["policeVehicle",true,true];
		};
	case independent:
		{
		[_vehicle] spawn DS_fnc_setUpVeh;
		_vehicle setVariable ["wlCivVehicle",true,true];
		};
	case civilian:
		{
		if(((_vInfo select 9)select 9) == 5)then
			{
			_vehicle setVariable ["setUp",5,true];
			[_vehicle,5] spawn DS_fnc_setUpVeh;
			};
		if(((_vInfo select 9)select 9) == 4)then
			{
			_vehicle setVariable ["setUp",4,true];
			[_vehicle,4] spawn DS_fnc_setUpVeh;
			};
		if(((_vInfo select 9)select 9) == 0)then
			{
			_vehicle setVariable ["setUp",0,true];
			[_vehicle,0] spawn DS_fnc_setUpVeh;
			};
		if(((_vInfo select 9)select 9) == 1)then
			{
			_vehicle setVariable ["setUp",1,true];
			_vehicle setVariable ["special",true,true];
			[_vehicle,1] spawn DS_fnc_setUpVeh;
			};
		};
	};
_spawnString = "Your vehicle is ready!\n\n\nUpgrades added...\n\n";

if(((_vInfo select 9)select 0) == 1)then
	{
	_vehicle setVariable["extraspace",true,true];
	_spawnString = _spawnString + "Upgraded Storage Bonus\n";
	};
if(((_vInfo select 9)select 0) == 2)then
	{
	_vehicle setVariable["extraspaceAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Storage Bonus\n";
	};
if(((_vInfo select 9)select 1) == 1)then
	{
	_vehicle setVariable["fuel",true,true];
	_spawnString = _spawnString + "Upgraded Fuel Usage Bonus\n";
	};
if(((_vInfo select 9)select 1) == 2)then
	{
	_vehicle setVariable["fuelAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Fuel Usage Bonus\n";
	};
if(((_vInfo select 9)select 2) == 1)then
	{
	_vehicle setVariable["security",true,true];
	_spawnString = _spawnString + "Upgraded Security Bonus\n";
	};
if(((_vInfo select 9)select 2) == 2)then
	{
	_vehicle setVariable["securityAdv",true,true];
	_spawnString = _spawnString + "Upgraded Super Security Bonus\n";
	};
if(((_vInfo select 9)select 3) == 1)then
	{
	_vehicle setVariable["thermal",true,true];
	_spawnString = _spawnString + "Thermal Enabled\n\n\n";
	_vehicle disableTIEquipment false;
	};
if(((_vInfo select 9)select 3) == 2)then
	{
	_vehicle setVariable["thermal",true,true];
	_vehicle setVariable["bulletProof",true,true];
	_spawnString = _spawnString + "Thermal Enabled\n\n\nBulletProof Body\n\n\n";
	_vehicle disableTIEquipment false;
	};

if((((_vInfo select 9)select 8) == 1)&&(typeOf _vehicle == "O_Truck_03_covered_F"))then
	{
	_vehicle setVariable["CCU",true,true];
	_spawnString = _spawnString + "Civilian Command Unit\n\n\n";
	};

if(((_vInfo select 9)select 8) == 2)then
	{
	_vehicle setVariable["GCU",true,true];
	_spawnString = _spawnString + "Gang Command Unit\n\n\n";
	};

if(((_vInfo select 9)select 4) == 2)then
	{
	_vehicle setVariable["insurance2",true,true];
	_spawnString = _spawnString + "Insurance X 2\n\n\n";
	};

if(((_vInfo select 9)select 4) == 1)then
	{
	_vehicle setVariable["insurance1",true,true];
	_spawnString = _spawnString + "Insurance X 1\n\n\n";
	};
if(((_vInfo select 9)select 5) > 0)then
	{
	_vehicle setVariable["airBags",((_vInfo select 9)select 5),true];
	_spawnString = _spawnString + format ["Airbags X %1\n\n\n",(((_vInfo select 9)select 5)/2)];
	};
if(((_vInfo select 9)select 6) > 0)then
	{
	_vehicle setVariable["vehAmmo",true,true];
	_spawnString = _spawnString + format ["Extra Ammo\n\n\n",(((_vInfo select 9)select 5)/2)];
	};
if(((_vInfo select 9)select 7) > 0)then
	{
	_vehicle setVariable["vehAnimal",true,true];
	_spawnString = _spawnString + format ["Vehicle Animal Sensors\n\n\n",(((_vInfo select 9)select 5)/2)];
	};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 14)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 55)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((player getVariable ["security",false])&&((DS_infoArray select 19) > 28)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) > 10)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 19))then
	{
	_vehicle setVariable ["fuel",true,true];
	_spawnString = _spawnString + "Quest enabled Fuel Upgrade\n\n\n";
	};
if((player getVariable ["security",false])&&((DS_infoArray select 19) > 29))then
	{
	_vehicle setVariable ["securityAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Security Upgrade\n\n\n";
	};

if((player getVariable ["medic",false])&&((DS_infoArray select 10) > 24))then
	{
	_vehicle setVariable ["securityAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Security Upgrade\n\n\n";
	};

if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 42)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["vehAnimal",true,true];
	_spawnString = _spawnString + "Quest enabled Animal Repellent Upgrade\n\n\n";
	};
if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 41))then
	{
	_vehicle setVariable ["fuelAdv",true,true];
	_spawnString = _spawnString + "Quest enabled Super Fuel Upgrade\n\n\n";
	};
if((playerSide isEqualTo civilian)&&((DS_infoArray select 13) > 51)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if((player getVariable ["medic",false])&&((DS_infoArray select 10) > 17)&&(_vehicle isKindOf "LandVehicle"))then
	{
	_vehicle setVariable ["airBags",9999,true];
	_spawnString = _spawnString + "Quest enabled Unlimited Airbags\n\n\n";
	};
if(DS_realMode)then
	{
	_vehicle setVariable ["realMode",true,true];
	_spawnString = _spawnString + "Realistic mode locks\n\n\n";
	};
if((((DS_infoArray select 31) > 1)&&(playerside == civilian))&&(!(_vehicle getVariable["GCU",false])))then
	{
	_vehicle setVariable ["CCU",true,true];
	_spawnString = _spawnString + "CCU Abilities\n\n\n";
	};

[_vehicle] spawn DS_fnc_clearVehAmmo;

switch(DS_perkLevel)do
	{
	case 1: {_vehicle setVariable["extraspace1",true,true];_spawnString = _spawnString + "Perk Level 1 Storage Bonus";};
	case 2: {_vehicle setVariable["extraspace2",true,true];_spawnString = _spawnString + "Perk Level 2 Storage Bonus";};
	case 3: {_vehicle setVariable["extraspace3",true,true];_spawnString = _spawnString + "Perk Level 3 Storage Bonus";};
	case 4: {_vehicle setVariable["extraspace4",true,true];_spawnString = _spawnString + "Perk Level 4 Storage Bonus";};
	case 5: {_vehicle setVariable["extraspace5",true,true];_spawnString = _spawnString + "Perk Level 5 Storage Bonus";};
	};

if(_spawnString == "Your vehicle is ready!\n\n\nUpgrades added...\n\n")then
	{
	_spawnString = "Your vehicle is ready";
	};
hint format ["%1",_spawnString];


if(((typeOf _vehicle) == "B_MRAP_01_F")&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
	{
	_vehTextureArray = ["extras\textures\vehicles\hp.jpg","extras\textures\vehicles\hp_b.jpg"];
	[_vehicle,2,_vehTextureArray] call DS_fnc_globalTexture;
	};

if(((typeOf _vehicle) == "C_SUV_01_F")&&(playerSide isEqualTo civilian)&&((_vInfo select 8) == 4))then
	{
	_vehicle setVariable ["taxi",true,true];
	};

if(_vehicle isKindOf "Air")then {
	[_vehicle] spawn DS_fnc_airVehicleEH
};

_vehicle spawn {
	sleep 3;
	_damage = getDammage _this;
	if(_damage >= 1)then {
		[_this,false,player] remoteExec ["HUNT_fnc_storeVehicle",2];
		hint "Vehicle returned to your garage because of a dodgey spawn location";
		DS_storingVehicle = true;
	};
	sleep 2;
	if(isNil "_this")then {
		_this setDamage 0;
	};
};

if((playerSide isEqualTo civilian)&&((typeOf _vehicle) in _rebelVehicles)&&((player distance reb_1_1_1 > 200)&&(player distance reb_1_1_2 > 200)&&(player distance reb_1_1 > 200)&&(player distance adminSpawn > 200)&&(player distance clanBase1 > 200)&&(player distance clanBase2 > 200)&&(player distance clanBase3 > 200)&&(player distance clanBase4 > 200)&&(player distance clanBase5 > 200)&&(player distance clanBase7 > 200)&&(player distance clanBase8 > 200)&&(player distance clanBase9 > 200)&&(player distance clanBase10 > 200)&&(player distance clanBase11 > 200)&&(player distance clanBase12 > 200)))exitWith
	{
	hint "This vehicle type can only be retrieved at rebel outpost";
	_vehicle setPos [0,0,0];
	_vehicle allowDamage false;
	[_vehicle,false,player] remoteExec ["HUNT_fnc_storeVehicle",2];
	};

[_vehicle] spawn {
	_marker = createMarkerLocal [format["%1_marker",(_this select 0)],visiblePosition (_this select 0)];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Recently Ungaraged Vehicle";
	sleep 60;
	deleteMarkerLocal _marker;
};