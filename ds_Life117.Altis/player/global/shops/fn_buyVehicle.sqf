/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks what shop the player is trying to access and displays the data needed
*/
disableSerialization;
private["_upgrades","_exit","_perkVehicles","_perkVehicles1","_spawn","_buy","_className","_price","_vehicle","_defaultArray","_spawnMax","_spawnIndex","_combo","_dialog"];

_dialog = findDisplay 666667;
_combo = _dialog displayCtrl 66653;
_exit = false;
_upgrades = false;
_spawn = DS_spawnPoint;//[1,1,1]
_buy = _this select 0;
_className = DS_className;

if((playerside != west)&&(DS_AirBan)&&(_className isKindOf "Air"))then
	{
	_action = [
	"There is currently a server wide flying ban, are you sure you want to risk being shot down on sight by buying this vehicle during this time?",
	"Grounded Air Vehicles",
	"Yes FTP",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};

if((DS_pistolsOnly)&&(_className in ["O_MRAP_02_F","I_MRAP_03_F","B_MRAP_01_F",""]))exitwith{hint "You can not use this vehicle during a pistols only event";systemchat "You can not use this vehicle during a pistols only event";}; 
_price = DS_price;
_perkVehicles = ["B_Truck_01_box_F","O_Truck_03_device_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F","O_MRAP_02_F","I_MRAP_03_F"];
if((_buy)&&(DS_perkLevel < 1)&&(_className in _perkVehicles)&&(playerside != west))exitwith{hint "Buying failed, you must be level 1 perk level or above to permanently purchase this vehicle type"};
_perkVehicles1 = ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"];
if((_buy)&&(DS_perkLevel < 3)&&(_className in _perkVehicles1)&&(playerside != west))exitwith{hint "Buying failed, you must be level 3 perk level or above to permanently purchase this vehicle type"};
if((_buy)&&(_className in ["B_Quadbike_01_F"]))exitwith{hint "This vehicle type can only be rented"};
if(_buy)then{_price = _price*1.5};
_spawnMax = (count(DS_spawnPoint));//3
_spawnIndex = 0;

if((playerside == west)&&(_className isKindOf "Air")&&((player getVariable ["policeSquad",""]) == "Coast Guard"))then{_price = _price*0.5};

if((playerside == civilian)&&(_className in ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"]))then
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
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*3);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "CAR")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*3);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "TANK")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*3);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
		if((DS_vehUpgrades select 7) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Ammo Upgrade |";};
		};
	if(_className isKindOf "SHIP")then
		{
		if((DS_vehUpgrades select 0) > 0)then{_price = _price + 40000;_upgradesTxt = _upgradesTxt + "| Trunk Capacity |";};
		if((DS_vehUpgrades select 1) > 0)then{_price = _price + 20000;_upgradesTxt = _upgradesTxt + "| Fuel Consumption |";};
		if((DS_vehUpgrades select 2) > 0)then{_price = _price + 30000;_upgradesTxt = _upgradesTxt + "| Vehicle Security |";};
		if((DS_vehUpgrades select 3) > 0)then{_price = _price + 25000;_upgradesTxt = _upgradesTxt + "| Vehicle AirBags |";};
		if((DS_vehUpgrades select 4) > 0)then{_price = _price + 50000;_upgradesTxt = _upgradesTxt + "| Animal Sensor |";};
		if((DS_vehUpgrades select 5) > 0)then{_price = _price + (DS_price*3);_upgradesTxt = _upgradesTxt + "| Vehicle Insurance |";};
		if((DS_vehUpgrades select 6) > 0)then{_price = _price + 800000;_upgradesTxt = _upgradesTxt + "| Thermal Vision |";};
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
	if(!isNil {_vehTextureArray})then
		{
		if(!(_vehTextureArray isEqualTo []))then
			{
			if(count(_vehTextureArray) > 1)then
				{
				[[DS_vehicle,true,_vehTextureArray],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
				}
				else
				{
				[[DS_vehicle,false,_vehTextureArray],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
				};
			};
		};
	};
if(_textureIndex >= 0)then
	{
	_vehTextureArray = [_className,true,playerSide] call DS_fnc_vehicleTextures;
	_vehTextureArray = _vehTextureArray select _textureIndex;
	if(!isNil {_vehTextureArray})then
		{
		if(count(_vehTextureArray) > 1)then
			{
			[[DS_vehicle,true,_vehTextureArray],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
			}
			else
			{
			[[DS_vehicle,false,_vehTextureArray],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
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
if((playerside == west)&&(miscInfoArray select 8))then
	{
	DS_vehicle disableTIEquipment false;
	}
	else
	{
	DS_vehicle disableTIEquipment true;
	};

//Playerside stuffs
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
		if(player getVariable ["mechanic",false])then
			{
			[DS_vehicle] spawn DS_fnc_setUpVeh;
			};
		};
	};

DS_vehicle allowDamage true;

DS_keyRing pushBack DS_vehicle;
_defaultArray = [0,0,0,0,0,0,0,0,0,0];
_spawnString = "Your vehicle is ready!\n\n\nUpgrades added.....\n\n";
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
	if((DS_vehUpgrades select 6) > 0)then{DS_vehicle setVariable["thermal",true,true];_spawnString = _spawnString + "Vehicle Thermal Vision\n";_defaultArray set [3,1];DS_vehicle disableTIEquipment false;};
	if((DS_vehUpgrades select 7) > 0)then{DS_vehicle setVariable["vehAmmo",true,true];_spawnString = _spawnString + "Vehicle Ammo Upgrade\n";_defaultArray set [6,1];};
	};
	
if(_spawnString == "Your vehicle is ready!\n\n\nUpgrades added.....\n\n")then
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
	[[(getPlayerUID player),playerSide,DS_vehicle,_textureIndex,_defaultArray],"HUNT_fnc_createVehicle",false,false] spawn BIS_fnc_MP;
	};

if((DS_className in ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F"])&&((DS_infoArray select 17) == 8))then
	{
	[2] call DS_fnc_questCompleted;
	};
	
if((DS_className in ["C_Heli_Light_01_civil_F"])&&(player getVariable ["medic",false])&&((DS_infoArray select 10) == 14))then
	{
	[3] call DS_fnc_questCompleted;
	};

DS_vehUpgrades = [0,0,0,0,0,0,0,0,0,0];

if((DS_className == "B_MRAP_01_F")&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
	{
	_vehTextureArray = ["extras\textures\vehicles\hp.jpg","extras\textures\vehicles\hp_b.jpg"];
	[[DS_vehicle,true,_vehTextureArray],"DS_fnc_globalTexture",true,false] spawn BIS_fnc_MP;
	};