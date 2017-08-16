/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks what shop the player is trying to access and displays the data needed
*/

disableSerialization;
private["_rentPrice","_upgrades","_exit","_perkVehicles","_perkVehicles1","_spawn","_buy","_className","_price","_vehicle","_defaultArray","_spawnMax","_spawnIndex","_combo","_dialog"];

_dialog = findDisplay 666667;
_combo = _dialog displayCtrl 66653;
_exit = false;
_upgrades = false;
_spawn = DS_spawnPoint;//[1,1,1]
_buy = _this select 0;
_className = DS_className;

if(player distance shawn1 < 500)then {
	_group = shawn1 getVariable ["gangOwner",grpNull];
	if((group player) != _group)then {
		hint "You must own the KOS area before using this shop";
		_exit = true;
	};
};
if(_exit)exitWith{};
if((player distance shawn1 < 500)&&(_buy))exitwith {hint "Some error occurred"};
DS_doingStuff = false;
_buildingarray = nearestObjects [player, ["All"], 100];
	{
		if((!(_x isKindOf "Man"))&&(!(_x isKindOf "Car"))&&(!(_x isKindOf "Air"))&&(!(_x isKindOf "Ship")))then
			{
			_x setDamage 0;
			};
	} forEach _buildingarray;

if(_className in ["O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_ammo_F"])then
	{
	_action = [
	"To drive this vehicle you must own the Arma3 DLC (Choppers). If you do not own this DLC then do not buy this vehicle as it will be useless to you",
	"DLC Required",
	"Buy",
	"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};

if(_className in ["B_Plane_Fighter_01_F","O_Plane_Fighter_02_F","I_Plane_Fighter_04_F","C_Offroad_02_unarmed_F","C_Plane_Civil_01_F","I_C_Boat_Transport_02_F","C_Scooter_Transport_01_F","O_T_LSV_02_unarmed_F","B_T_LSV_01_unarmed_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])then
	{
	_action = [
	"To drive this vehicle you must own the Arma3 DLC (Apex and/or Jets). If you do not own this DLC then do not buy this vehicle as it will be useless to you",
	"DLC Required",
	"Buy",
	"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};

if((!(playerSide isEqualTo west))&&(DS_AirBan)&&(_className isKindOf "Air"))then
	{
	_action = [
	"There is currently a region wide flying ban, are you sure you want to risk being shot down on sight by buying this vehicle during this time?",
	"Grounded Air Vehicles",
	"Yes FTP",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};

_price = DS_price;
_rentPrice = DS_price;
_perkVehicles = ["B_Truck_01_box_F","O_Truck_03_device_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F","O_MRAP_02_F","I_MRAP_03_F"];
if((_buy)&&(DS_perkLevel < 1)&&(_className in _perkVehicles)&&(!(playerSide isEqualTo west)))exitwith{hint "Buying failed, you must be level 1 perk level or above to permanently purchase this vehicle type"};
_perkVehicles1 = ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"];
if((_buy)&&(DS_perkLevel < 3)&&(_className in _perkVehicles1)&&(!(playerSide isEqualTo west)))exitwith{hint "Buying failed, you must be level 3 perk level or above to permanently purchase this vehicle type"};
//if((_buy)&&(_className in ["B_Quadbike_01_F"]))exitwith{hint "This vehicle type can only be rented"};
if(_buy)then{_price = _price*1.5};
_spawnMax = (count(DS_spawnPoint));//3
_spawnIndex = 0;

if((playerSide isEqualTo west)&&(_className isKindOf "Air")&&((player getVariable ["policeSquad",""]) == "Coast Guard"))then{_price = _price*0.5};

if((playerSide isEqualTo civilian)&&(_className in ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"]))then
	{
	_action = [
	"Make sure you have read and understand the Armed Vehicle rules before using this vehicle.",
	"Armed Vehicle Rules",
	"I Understand",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};
//Will add error checks here

{
	if(_x > 0)then{_upgrades = true};
}forEach DS_vehUpgrades;

if(_upgrades)then
	{
	_upgradesTxt = "";
	if(_className isKindOf "AIR")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 70000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 80000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*2);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		//if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "CAR")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*2);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		//if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "TANK")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*2);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		//if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "SHIP")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*2);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		//if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	_action = [
	format ["You wish to have the following upgrades added %1. This brings your vehicles total price to $%2",_upgradesTxt,[_price] call DS_fnc_numberText],
	"Vehicle Upgrades",
	"Buy",
	"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;DS_vehUpgrades = [0,0,0,0,0,0,0,0,0,0]};
	};
if(_exit)exitwith{};
if([_price,false] call DS_fnc_checkMoney)exitwith{};//WTF
if(_price < 0)exitwith{};//Heh
//Sort out colours etc
{
	if(count(nearestObjects[(getMarkerPos (_spawn select _spawnIndex)),["Car","Ship","Air","Tank"],5]) > 0)then{_spawnIndex = _spawnIndex + 1};
}forEach DS_spawnPoint;
if(_spawnIndex >= _SpawnMax)exitwith{hint "There is no spawn point free at this time"};
_spawn = (_spawn select _spawnIndex);
[_price,false,false] call DS_fnc_handleMoney;

//Clean up any nearby remains
_nearbyRemains = (nearestObjects[(getMarkerPos _spawn),["Land_HumanSkeleton_F"],20]);
{
	deleteVehicle _x;
}forEach _nearbyRemains;

hint "Creating your vehicle";
DS_vehicle = createVehicle [_className, (getMarkerPos _spawn),[],0,"NONE"];
waitUntil {!isNull DS_vehicle};//Wait till vehicle spawns in
DS_vehicle allowDamage false;//Disable damage while spawning in
DS_vehicle lock 2;
DS_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawn));
DS_vehicle setDir (markerDir _spawn);
DS_vehicle setPos (getMarkerPos _spawn);
[DS_vehicle] spawn DS_fnc_clearVehAmmo;
_textureIndex = (lbCurSel _combo);
if(_textureIndex == -1)then
	{
	_textureIndex = 0;
	_vehTextureArray = [_className,true,playerSide] call DS_fnc_vehicleTextures;
	_vehTextureArray = _vehTextureArray select 0;
	if(!isNil "_vehTextureArray")then
		{
		if(!(_vehTextureArray isEqualTo []))then
			{
			if(count(_vehTextureArray) > 1)then
				{
				if(count(_vehTextureArray) > 2)then
					{
					[DS_vehicle,3,_vehTextureArray] call DS_fnc_globalTexture;
					}
					else
					{
					[DS_vehicle,2,_vehTextureArray] call DS_fnc_globalTexture;
					};
				}
				else
				{
				[DS_vehicle,1,_vehTextureArray] call DS_fnc_globalTexture;
				};
			};
		};
	};
if(_textureIndex >= 0)then
	{
	_vehTextureArray = [_className,true,playerSide] call DS_fnc_vehicleTextures;
	_vehTextureArray = _vehTextureArray select _textureIndex;
	if(!isNil "_vehTextureArray")then
		{
		if(count(_vehTextureArray) > 1)then
			{
			if(count(_vehTextureArray) > 2)then
				{
				[DS_vehicle,3,_vehTextureArray] call DS_fnc_globalTexture;
				}
				else
				{
				[DS_vehicle,2,_vehTextureArray] call DS_fnc_globalTexture;
				};
			}
			else
			{
			[DS_vehicle,1,_vehTextureArray] call DS_fnc_globalTexture;
			};
		};
	};

//Give vehicles it's texture here
DS_vehicle setVariable ["boot_open",false,true];
DS_vehicle setVariable ["boot",[[],0]];
DS_vehicle setVariable ["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
DS_vehicle setVariable ["sirens",false,true];
DS_vehicle setVariable ["policeVehicle",false,true];
DS_vehicle setVariable ["wlCivVehicle",false,true];
DS_vehicle setVariable ["vehicleTexture",_textureIndex,true];
if((playerSide isEqualTo west)&&(miscInfoArray select 8)&&(_className == "I_APC_Wheeled_03_cannon_F"))then
	{
	DS_vehicle disableTIEquipment false;
	}
	else
	{
	DS_vehicle disableTIEquipment true;
	};

_defaultArray = [0,0,0,0,0,0,0,0,0,0];
//Playerside stuffs

DS_nearRebel = {
	_rebelSpawns = ["reb_spawn_3","rebSpawn1","reb_spawn_2","adminspawnVeh"];
	_return = false;
	{
		if((player distance (getMarkerPos _x)) < 200)then
			{
			_return = true;
			};
	}forEach _rebelSpawns;
	_return;
};

DS_nearGang = {
	_rebelSpawns = ["gang_area_3_1","gang_area_2","gang_area_2_1"];
	_return = false;
	{
		if((player distance (getMarkerPos _x)) < 200)then
			{
			_return = true;
			};
	}forEach _rebelSpawns;
	_return;
};

switch(playerside)do
	{
	case west:
		{
		[DS_vehicle] spawn DS_fnc_setUpVeh;
		DS_vehicle setVariable ["policeVehicle",true,true];
		};
	case independent:
		{
		DS_vehicle setVariable ["wlCivVehicle",true,true];
		DS_vehicle setVariable ["setUp",1,true];
		if(player getVariable ["mechanic",false])then
			{
			[DS_vehicle] spawn DS_fnc_setUpVeh;
			};
		};
	case civilian:
		{
		if(typeOf DS_vehicle == "C_Offroad_02_unarmed_F")then
			{
			if([] call DS_nearRebel)then
				{
				_defaultArray = [0,0,0,0,0,0,0,0,0,5];//Rebel Areas
				[DS_vehicle,5] spawn DS_fnc_setUpVeh;
				DS_vehicle setVariable ["setUp",5,true];
				}
				else
				{
				if([] call DS_nearGang)then
					{
					_defaultArray = [0,0,0,0,0,0,0,0,0,4];//Hideouts Areas
					[DS_vehicle,4] spawn DS_fnc_setUpVeh;
					DS_vehicle setVariable ["setUp",4,true];
					}
					else
					{
					[DS_vehicle,0] spawn DS_fnc_setUpVeh;
					DS_vehicle setVariable ["setUp",0,true];
					};
				};
			};
		if(typeOf DS_vehicle == "B_Heli_Light_01_F")then
			{
			if([] call DS_nearRebel)then
				{
				_defaultArray = [0,0,0,0,0,0,0,0,0,5];//Rebel Areas
				[DS_vehicle,5] spawn DS_fnc_setUpVeh;
				DS_vehicle setVariable ["setUp",5,true];
				}
				else
				{
				if([] call DS_nearGang)then
					{
					_defaultArray = [0,0,0,0,0,0,0,0,0,4];//Hideouts Areas
					[DS_vehicle,4] spawn DS_fnc_setUpVeh;
					DS_vehicle setVariable ["setUp",4,true];
					}
					else
					{
					[DS_vehicle,0] spawn DS_fnc_setUpVeh;
					DS_vehicle setVariable ["setUp",0,true];
					};
				};
			};
		if(typeOf DS_vehicle == "C_Heli_Light_01_civil_F")then
			{
			[DS_vehicle,0] spawn DS_fnc_setUpVeh;
			DS_vehicle setVariable ["setUp",0,true];
			};
		if(typeOf DS_vehicle == "C_Offroad_01_F")then
			{
			[DS_vehicle,0] spawn DS_fnc_setUpVeh;
			DS_vehicle setVariable ["setUp",0,true];
			};
		if(typeOf DS_vehicle in ["B_T_LSV_01_unarmed_F","B_T_LSV_01_armed_F"])then
			{
			[DS_vehicle,0] spawn DS_fnc_setUpVeh;
			DS_vehicle setVariable ["setUp",0,true];
			};
		if(typeOf DS_vehicle in ["O_T_LSV_02_unarmed_F","O_T_LSV_02_armed_F"])then
			{
			[DS_vehicle,0] spawn DS_fnc_setUpVeh;
			DS_vehicle setVariable ["setUp",0,true];
			};
		};
	};
//C_Heli_Light_01_civil_F
DS_vehicle allowDamage true;

DS_keyRing pushBack DS_vehicle;
_spawnString = "Your vehicle is ready!\n\n\nUpgrades added...\n\n";
switch (DS_perkLevel) do
	{
	case 1: {DS_vehicle setVariable["extraspace1",true,true];_spawnString = _spawnString + "Perk Level 1 Storage Bonus";};
	case 2: {DS_vehicle setVariable["extraspace2",true,true];_spawnString = _spawnString + "Perk Level 2 Storage Bonus";};
	case 3: {DS_vehicle setVariable["extraspace3",true,true];_spawnString = _spawnString + "Perk Level 3 Storage Bonus";};
	case 4: {DS_vehicle setVariable["extraspace4",true,true];_spawnString = _spawnString + "Perk Level 4 Storage Bonus";};
	case 5: {DS_vehicle setVariable["extraspace5",true,true];_spawnString = _spawnString + "Perk Level 5 Storage Bonus";};
	};

if(_upgrades)then
	{
	if((DS_vehUpgrades select 0) > 0)then{DS_vehicle setVariable["extraspace",true,true];_spawnString = _spawnString + "Storage Capacity\n";_defaultArray set [0,1];};
	if((DS_vehUpgrades select 1) > 0)then{DS_vehicle setVariable["fuel",true,true];_spawnString = _spawnString + "Fuel Consumption\n";_defaultArray set [1,1];};
	if((DS_vehUpgrades select 2) > 0)then{DS_vehicle setVariable["security",true,true];_spawnString = _spawnString + "Vehicle Security\n";_defaultArray set [2,1];};
	if((DS_vehUpgrades select 3) > 0)then{DS_vehicle setVariable["airBags",50,true];_spawnString = _spawnString + "Vehicle Airbags\n";_defaultArray set [4,50];};
	if((DS_vehUpgrades select 4) > 0)then{DS_vehicle setVariable["vehAnimal",true,true];_spawnString = _spawnString + "Animal Sensor\n";_defaultArray set [7,1];};
	if((DS_vehUpgrades select 5) > 0)then{DS_vehicle setVariable["insurance2",true,true];_spawnString = _spawnString + "Vehicle Insurance X2\n";_defaultArray set [4,2];};
	//if((DS_vehUpgrades select 6) > 0)then{DS_vehicle setVariable["thermal",true,true];_spawnString = _spawnString + "Vehicle Thermal Vision\n";_defaultArray set [3,1];DS_vehicle disableTIEquipment false;};
	if((DS_vehUpgrades select 7) > 0)then{DS_vehicle setVariable["vehAmmo",true,true];_spawnString = _spawnString + "Vehicle Ammo Upgrade\n";_defaultArray set [6,1];};
	};
	
if(player distance shawn1 < 500)then {
	_spawnString = _spawnString + "KOS Upgrades \n\nSuper Fuel\nSecurity\nAmmo Upgrade\nAnimal Repellent\nAir Bags";
	DS_vehicle setVariable ["securityAdv",true,true];
	DS_vehicle setVariable ["fuelAdv",true,true];
	DS_vehicle setVariable ["vehAmmo",true,true];
	DS_vehicle setVariable ["airBags",10000,true];
	DS_vehicle setVariable ["animal",true,true];
	DS_vehicle setVariable ["special",true,true];
	[DS_vehicle] spawn DS_fnc_clearVehAmmo;
	DS_vehicle setVariable ["noChop",true,true];
	if(typeOf DS_vehicle in ["O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F"])then {
		DS_vehicle setVariable ["GCU",true,true];
		DS_vehicle setVariable ["smallSpace",true,true];
		_spawnString = _spawnString + "\n\nGCU Abilities";
	};
};

if(((DS_infoArray select 31) > 1)&&(playerside == civilian))then
	{
	DS_vehicle setVariable ["CCU",true,true];
	_spawnString = _spawnString + "CCU Abilities\n\n\n";
	};

if(_spawnString == "Your vehicle is ready!\n\n\nUpgrades added...\n\n")then
	{
	_spawnString = "Your vehicle is ready";
	};
hint format ["%1",_spawnString];
//Give perk level bonus space and tell them

//run server payment stuff



[] call DS_fnc_compileData;

closeDialog 0;

if(_buy)then
	{
	[(getPlayerUID player),playerSide,DS_vehicle,_textureIndex,_defaultArray,_price,player,DS_perkLevel] remoteExec ["HUNT_fnc_createVehicle",2];
	};

DS_vehUpgrades = [0,0,0,0,0,0,0,0,0,0];

if((DS_className == "B_MRAP_01_F")&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
	{
	_vehTextureArray = ["extras\textures\vehicles\hp.jpg","extras\textures\vehicles\hp_b.jpg"];
	[DS_vehicle,2,_vehTextureArray] call DS_fnc_globalTexture;
	};

if((DS_className == "C_SUV_01_F")&&(playerSide isEqualTo civilian)&&(_textureIndex == 4))then
	{
	DS_vehicle setVariable ["taxi",true,true];
	};

if(DS_className isKindOf "Air")then {
	[DS_vehicle] spawn DS_fnc_airVehicleEH
};

DS_vehicle spawn {
	sleep 5;
	_this setDamage 0;
};

if(((DS_infoArray select 17) == 8)&&((typeOf DS_vehicle) in ["B_G_Offroad_01_armed_F","O_T_LSV_02_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","B_T_LSV_01_armed_F"]))then { [2] call DS_fnc_questCompleted };
if(((DS_infoArray select 10) == 14)&&((typeOf DS_vehicle) in ["C_Heli_Light_01_civil_F"]))then { [3] call DS_fnc_questCompleted };