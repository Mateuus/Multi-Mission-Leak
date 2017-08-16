/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Uses items clicked on in the Y menu
*/

//Disabling network sounds as a lag test

private["_tempNum","_item","_bluePrints","_itemWeapons","_itemAmmo","_itemPacks"];
disableSerialization;

if((lbCurSel 9009) == -1) exitWith {hint "You need to select an item first!";};
if((player getVariable["restrained",FALSE])||(player getVariable["escorted",FALSE])) exitwith {hint "You cant use items while restrained";};
_item = lbData[9009,(lbCurSel 9009)];
_itemPacks = ["packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU"];
_itemWeapons = ["gunCyrus","gunLynx","gunLynxAdv","gunRpg","gun3gl","gunNavid","gunRpg7","gunSpmg"];
_itemAmmo = ["ammoLynx","ammoLynxAdv","ammoRpg","ammoRpgAdv","ammoFlash","ammoTear","ammoRpgHE","ammoRpgHEAdv","ammoRpg7","ammoRpg7Adv"];
_bluePrints = ["bpVehSecurity","bpVehWeight","bpVehFuel","bpVehNos","bpGunLynx","bpAmmoLynx","bpAmmoRpg","bpAmmoRpgHE","bpVehSUV","bpGunRpg","bpGun3gl","bpGunNavid","bpCyrus","bpWeaponsAir","bpWeaponsLand","bpBlackfoot","bpGunRpg7","bpAirbags","bpInsurance","bpArmourAdv","bpGunSpmg","bpAmmoRpg7"];
_vehUpgrades = ["vehSecurity","vehSecurityAdv","vehWeight","vehWeightAdv","vehFuel","vehFuelAdv","vehNos","vehNosAdv","vehAmmo","weaponsAir","weaponsLand","airBags","insurance"];
closeDialog 0;
switch (true) do
{
	case (_item == "armourAdv"):
		{
		if(!isNull objectParent player)exitwith{hint "You can not put on body armour while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 4;
		DS_armour = 15;
		hint "Body Armour Fitted";
		};
	case (_item == "armour"):
		{
		if(!isNull objectParent player)exitwith{hint "You can not put on body armour while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 27))then
			{
			sleep 1;
			}
			else
			{
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4;
			};
		if((playerside == west)&&((DS_infoArray select 21) > 34))then {
			DS_armour = 15;
		} else {
			DS_armour = 10;
		};
		if(DS_realMode)then{DS_armour = 15};
		hint "Body Armour Fitted";
		};
	case (_item == "ied"):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		[] spawn DS_civ_setupIed;
		};
	case (_item == "UAV"):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		["B_UAV_01_F","Portable UAV",_item] spawn DS_fnc_setUpItem;
		};
	case (_item == "fire"):
		{
		if(isNil "DS_firePlaced")then
			{
			DS_firePlaced = false;
			};
		if(DS_firePlaced)exitwith{hint "You have planted a fireplace too recently to plant another, either pack up the one you planted or wait until you are able to plant another"};
		if(DS_jailed)exitwith{hint "You can not use this item in jail"};
		[_item,false,1] call DS_fnc_handleInventory;
		["Land_Campfire_F","Camp Fire",_item] spawn DS_fnc_setUpItem;
		[] spawn
			{
			sleep 1200;
			DS_firePlaced = false;
			};
		};
	case (_item == "spikeStrip"):
		{
		if(!isNull objectParent player)exitwith{hint "You can not use this while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		[] spawn DS_cop_deploySpikes;
		};
	case (_item == "buildingBox"):
		{
		if(!isNull objectParent player)exitwith{hint "You can not use this while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		["Land_WoodenBox_F"] spawn DS_fnc_placeBuildingBox;
		};
	case (_item == "goKart"):
		{
		if(DS_jailed)exitwith{hint "You can not use this item in jail"};
		if(!isNull objectParent player)exitwith{hint "You can not use this while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		["C_Kart_01_Blu_F","Portable Kart",_item] spawn DS_fnc_setUpItem;
		};
	case (_item == "mediKit"):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		[] spawn DS_fnc_mediKit;
		};
	case (_item in ["water","coffee","pepsi"]):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		[_item] spawn DS_fnc_drink;
		};
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","donut","tbacon","peach","pie","burger","chips","doritos","wheatp"]):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		[_item] spawn DS_fnc_eat;
		};
	case (_item in ["nitro","vehNos","vehNosAdv"]):
		{
		[] spawn DS_fnc_installNos;
		};
	case (_item in ["nitro","vehNos","vehNosAdv"]):
		{
		[] spawn DS_fnc_installNos;
		};
	case (_item in ["sodiumPack","hydroPack"]):
		{
		[_item] call DS_fnc_openPack;
		};
	case (_item in ["siphonKit"]):
		{
		[] spawn DS_fnc_siphonKit;
		};
	case (_item in ["lighter"]):
		{
		[] spawn DS_fnc_vehBurn;
		};
	case (_item in _itemPacks):
		{
		[_item] call DS_fnc_openItemPack;
		};
	case (_item in ["vodka","bourbon"]):
		{
		[_item] spawn DS_fnc_alcohol;
		};
	case (_item == "c4"):
		{
		[_item] spawn DS_civ_useC4;
		};
	case (_item == "defuse"):
		{
		[_item] spawn DS_cop_defuseC4;
		};
	case (_item in _bluePrints):
		{
		[_item] spawn DS_civ_bluePrintInfo;
		if((DS_infoArray select 13) == 24)then {
			[0] call DS_fnc_questCompleted;
		};
		};
	case (_item in _vehUpgrades):
		{
		[_item] spawn DS_fnc_installUpgrades;
		};
	case (_item in _itemWeapons):
		{
		[_item,0] spawn DS_fnc_giveWeapon;
		};
	case (_item in _itemAmmo):
		{
		[_item,1] spawn DS_fnc_giveWeapon;
		};
	case (_item in ["houseItemUpgrade","houseWeaponUpgrade"]):
		{
		hint "To use this attempt to upgrade your house past its capacity with this item in your inventory";
		};
	case (_item in ["jail10"]):
		{
		closeDialog 0;
		sleep 0.2;
		if(DS_jailed)exitwith{hint "You can not use this item in jail"};
		["jail10",false,1] call DS_fnc_handleInventory;
		["Land_PierLadder_F"] spawn DS_fnc_placeBuildingBox;
		};
	case (_item in ["idChanger"]):
		{
		closeDialog 0;
		sleep 0.2;
		["idChanger",false,1] call DS_fnc_handleInventory;
		_rand = ceil random 20;
		DS_realEstateArray set [14,_rand];
		[] call DS_fnc_compileData;
		hint "Your fake ID is now in effect. Your false name can be viewed by pressing 7. Police can only detect false ID's at their police stations";
		systemchat "Your fake ID is now in effect. Your false name can be viewed by pressing 7. Police can only detect false ID's at their police stations";
		if(player != (vehicle player))then {
			[] spawn {
				_action = [
					"Since you're in a vehicle, do you want this vehicle to be registered to the same name as your fake ID rather than your real name? (This will last until the vehicle is stored/impounded/destroyed)",
					"Vehicle Rego",
					"Yes",
					"No Thanks"
				] call BIS_fnc_guiMessage;
				if(!_action)exitwith{};
				_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
				_random = _randomNames select (DS_realEstateArray select 14);
				(vehicle player) setVariable ["vehicle_owners",[[(getPlayerUID player),_random,player]],true];
			};
		};
		};
	case (_item in ["jailBreak"]):
		{
		if(!DS_jailed)exitwith{hint "You can only use this item while in jail"};
		if((player getVariable ["bounty",0]) > 300000)exitwith{hint "You can not use this with a bounty over $300,000"};
		closeDialog 0;
		sleep 0.2;
		["jailBreak",false,1] call DS_fnc_handleInventory;
		DS_jailed = false;
		player linkItem "ItemMap";
		[400,false] spawn DS_fnc_handleMoral;
		_markerArray = [getMarkerPos "jobMarker30",getMarkerPos "jobMarker2",getMarkerPos "jobMarker4",getMarkerPos "jobMarker9",getMarkerPos "jobMarker12"];
		_markerlocation = (selectRandom _markerArray);
		player setPos _markerlocation;
		//_vehicle = "O_Heli_Light_02_unarmed_F" createVehicle getPos player;
		_vehicle = "B_Quadbike_01_F" createVehicle getPos player;
		_vehicle setObjectTextureGlobal [0,"extras\icons\donut.jpg"];
		_vehicle setObjectTextureGlobal [1,"extras\icons\donut.jpg"];
		DS_keyRing pushBack _vehicle;
		DS_bailValue = 0;
		player forceWalk false;
		sleep 8;
		player allowDamage true;
		[0,format["%1 has been broken out of jail by Stratis terrorists",name player],true,2] remoteExecCall ["DS_fnc_globalMessage",-2];
		if((DS_infoArray select 17) == 35)then {
			_tempNum = (DS_infoArray select 18) + 1;
			if(_tempNum > 2)then {
				[2] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [18,_tempNum];
			};
		};
		};
	case (_item in ["steroids"]):
		{
		closeDialog 0;
		sleep 0.2;
		["steroids",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will increase your carry weight to 500kg for one hour. Re logging will end this timer?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["steroids",true,1] call DS_fnc_handleInventory;};
		[] spawn
			{
			_time = time + 3600;
			while{true}do
				{
				DS_maxWeight = 500;
				sleep 3;
				if(time > _time)exitwith{};
				};
			private["_bp","_load","_cfg"];
			_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			_load = round(_cfg / 8);
			hint "Your Steroids have worn off";
			systemChat "Your Steroids have worn off";
			DS_maxWeight = 24 + _load;
			if(isNil{_bp}) then
				{
				DS_maxWeight = 24;
				};
			};
			if(DS_drunk > 0)then {
				if((DS_infoArray select 15) > 40)then {
					DS_maxWeight = 300;
				} else {
					DS_maxWeight = 120;
				};
			};
		};
	case (_item in ["noRecoil"]):
		{
		closeDialog 0;
		sleep 0.2;
		if((DS_infoArray select 15) < 41)exitwith{hint "You can only use this item if you have completed the Methhead 2 quest"};
		["noRecoil",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will remove your recoil for 10 minutes, Re Logging will cancel this buff. Continue?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["noRecoil",true,1] call DS_fnc_handleInventory;};
		if(isNil "DS_recoilUsed")then{DS_recoilUsed = false};
		if(DS_recoilUsed)exitwith{["noRecoil",true,1] call DS_fnc_handleInventory;hint "You are in a cooldown between no recoil uses at the moment, please wait longer"};
		[] spawn
			{
			DS_recoilUsed = true;
			_time = time + 600;
			_recoil = unitRecoilCoefficient player;
			while{true}do
				{
				player setUnitRecoilCoefficient 0;
				sleep 10;
				if(time > _time)exitwith{};
				};
			player say3D "fail";
			hint "Your Recoil Buff has worn off";
			systemChat "Your Recoil Buff has worn off";
			player setUnitRecoilCoefficient _recoil;
			sleep 600;
			DS_recoilUsed = false;
			player say3D "dingDong";
			hint "Your no recoil cooldown is over";
			systemchat "Your no recoil cooldown is over";
			};
		};
	case (_item in ["pawnee"]):
		{
		closeDialog 0;
		sleep 0.2;
		["pawnee",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will spawn a fully armed pawnee nearby you. Make sure you are in a wide open and flat space otherwise it could explode",
				"Warning",
				"Spawn It",
				"Not Yet"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["pawnee",true,1] call DS_fnc_handleInventory;};
		[400,false] spawn DS_fnc_handleMoral;
		_vehicle = "B_Heli_Light_01_armed_F" createVehicle getPos player;
		_vehicle setVariable["noChop",true,true];
		_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
		_vehicle setVariable ["fuelAdv",true,true];
		DS_keyRing pushBack _vehicle;
		if((DS_infoArray select 17) == 36)then { [2] call DS_fnc_questCompleted };
		};
	case (_item in ["plane"]):
		{
		closeDialog 0;
		sleep 0.2;
		["plane",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will spawn an armed plane nearby you. Make sure you are in a wide open and flat space otherwise it could explode (And you have room to take off)",
				"Warning",
				"Spawn It",
				"Not Yet"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["plane",true,1] call DS_fnc_handleInventory;};
		[400,false] spawn DS_fnc_handleMoral;
		_vehicle = "C_Plane_Civil_01_F" createVehicle getPos player;
		_vehicle setVariable["noChop",true,true];
		_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
		DS_keyRing pushBack _vehicle;
		_vehicle addWeapon "M134_minigun";
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		_vehicle addWeapon "LMG_coax";
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_762x51_Belt_T_Yellow",[-1]];
		_vehicle addWeapon "CMFlareLauncher";
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle addMagazineTurret ["300Rnd_CMFlare_Chaff_Magazine",[-1]];
		_vehicle setVariable ["fuelAdv",true,true];
		_gun1 = createSimpleObject ["B_HMG_01_F",[0,0,0]];_gun1 attachTo [_vehicle,[3,0.6,-1.85]];_gun1 setVectorUp [0,0,-1];
		_gun2 = createSimpleObject ["B_HMG_01_F",[0,0,0]];_gun2 attachTo [_vehicle,[-3,0.6,-1.85]];_gun2 setVectorUp [0,0,-1];
		};
	case (_item in ["blackfoot"]):
		{
		closeDialog 0;
		sleep 0.2;
		["blackfoot",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will spawn an armed blackfoot chopper nearby you. Make sure you are in a wide open and flat space otherwise it could explode",
				"Warning",
				"Spawn It",
				"Not Yet"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["blackfoot",true,1] call DS_fnc_handleInventory;};
		[400,false] spawn DS_fnc_handleMoral;
		_vehicle = "B_Heli_Attack_01_F" createVehicle getPos player;
		waitUntil{!isNull _vehicle};
		[_vehicle] call DS_fnc_clearVehAmmo;
		_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
		_vehicle setVariable["noChop",true,true];
		_vehicle setVariable ["fuelAdv",true,true];
		DS_keyRing pushBack _vehicle;
		};
	default
	{
		hint "You can not use this item through this menu\n\nIf you're trying to use a vehicle item, press your windows key on the vehicle to bring up the vehicle interaction menu";
	};
};

closeDialog 0;
[] call DS_fnc_menuPlayer;
[] call DS_fnc_updateHud;