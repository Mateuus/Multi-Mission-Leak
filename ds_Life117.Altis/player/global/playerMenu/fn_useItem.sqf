/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Uses items clicked on in the Y menu
*/

//Disabling network sounds as a lag test

private["_item","_bluePrints","_itemWeapons","_itemAmmo","_itemPacks"];
disableSerialization;

if((lbCurSel 9009) == -1) exitWith {hint "You need to select an item first!";};
if((player getVariable["cuffed",FALSE]) OR (player getVariable["Escorted",FALSE]) OR (player getVariable["cuffedVeh",FALSE])) exitwith {hint "You cant use items while restrained";};
_item = lbData[9009,(lbCurSel 9009)];
_itemPacks = ["packSteel","packBronze","packGlass","packCircuitBoard","packBattery","packCPU"];
_itemWeapons = ["gunLynx","gunLynxAdv","gunRpg","gun3gl","gunNavid"];
_itemAmmo = ["ammoLynx","ammoLynxAdv","ammoRpg","ammoRpgAdv","ammoFlash","ammoTear"];
_bluePrints = ["bpVehSecurity","bpVehWeight","bpVehFuel","bpVehNos","bpGunLynx","bpAmmoLynx","bpAmmoRpg","bpVehSUV","bpGunRpg","bpGun3gl","bpGunNavid","bpThermal","bpWeaponsAir","bpWeaponsLand","bpBlackfoot"];
_vehUpgrades = ["vehSecurity","vehSecurityAdv","vehWeight","vehWeightAdv","vehFuel","vehFuelAdv","vehNos","vehNosAdv","vehAmmo","weaponsAir","weaponsLand","thermal"];
closeDialog 0;
switch (true) do
{
	case (_item == "armour"):
		{
		if((vehicle player) != player)exitwith{hint "You can not put on body armour while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		if((playerside == west)&&((DS_infoArray select 21) > 27))then
			{
			sleep 1;
			}
			else
			{
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4;
			};
		if(playerside == civilian)then
			{
			DS_armour = 15;
			}
			else
			{
			DS_armour = 10;
			};
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
		if(DS_jailed)exitwith{hint "You can not use this item in jail"};
		[_item,false,1] call DS_fnc_handleInventory;
		["Land_Campfire_F","Camp Fire",_item] spawn DS_fnc_setUpItem;
		};
	case (_item == "spikeStrip"):
		{
		if((vehicle player) != player)exitwith{hint "You can not use this while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		[] spawn DS_cop_deploySpikes;
		};
	case (_item == "buildingBox"):
		{
		if((vehicle player) != player)exitwith{hint "You can not use this while inside a vehicle"};
		[_item,false,1] call DS_fnc_handleInventory;
		["Land_WoodenBox_F"] spawn DS_fnc_placeBuildingBox;
		};
	case (_item == "goKart"):
		{
		if(DS_jailed)exitwith{hint "You can not use this item in jail"};
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
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","donut","tbacon","peach","pie","burger","chips","doritos"]):
		{
		[_item,false,1] call DS_fnc_handleInventory;
		[_item] spawn DS_fnc_eat;
		};
	case (_item in ["sodiumPack","hydroPack"]):
		{
		[_item] call DS_fnc_openPack;
		};
	case (_item in _itemPacks):
		{
		[_item] call DS_fnc_openItemPack;
		};
	case (_item in ["vodka","bourbon"]):
		{
		[_item,false,1] call DS_fnc_handleInventory;
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
		["jail10",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will only benefit you while in jail, Continue?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["jail10",true,1] call DS_fnc_handleInventory;};
		[] spawn 
			{
			while{DS_jailed}do
				{
				DS_jail_info set [4,true];
				};
			systemChat "Jail sentence ended";
			player say3D "success";
			};
		};
	case (_item in ["idChanger"]):
		{
		closeDialog 0;
		sleep 0.2;
		["idChanger",false,1] call DS_fnc_handleInventory;
		_rand = ceil random 20;
		DS_realEstateArray set [15,_rand];
		[] call DS_fnc_compileData;
		hint "Your fake ID is now in effect. Your false name can be viewed by pressing 7. Police can only detect false ID's at their police stations";
		systemchat "Your fake ID is now in effect. Your false name can be viewed by pressing 7. Police can only detect false ID's at their police stations";
		};
	case (_item in ["jailBreak"]):
		{
		if(!DS_jailed)exitwith{hint "You can only use this item while in jail"};
		closeDialog 0;
		sleep 0.2;
		["jailBreak",false,1] call DS_fnc_handleInventory;
		DS_jailed = false;
		player addItem "ItemMap";
		player assignItem "ItemMap";
		[400,false] spawn DS_fnc_handleMoral;
		_markerArray = [getmarkerpos "jailQuest1",getmarkerpos "camTest3",getmarkerpos "carbomb2",getmarkerpos "gfdgdc",getmarkerpos "cdscsd"];
		_newmarker = (floor(random(count _markerArray)));
		_markerlocation = (_markerArray select _newmarker);	
		player setPos _markerlocation;
		_vehicle = "O_Heli_Light_02_unarmed_F" createVehicle getPos player;
		DS_keyRing pushBack _vehicle;
		DS_bailValue = 0;
		player forceWalk false;
		sleep 8;
		player allowDamage true;
		[[0,format["%1 has been broken out of jail by Stratis Terrorist",name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		[[1,format["%1 has been broken out of jail by Stratis Terrorist",name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		[[2,format["%1 has been broken out of jail by Stratis Terrorist",name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		sleep 5;
		if((DS_infoArray select 17) == 35)then
			{
			_tempNum = DS_infoArray select 18;
			_tempNum = _tempNum + 1;
			DS_infoArray set [18,_tempNum];
			if((DS_infoArray select 18) > 2)then
				{
				[2] call DS_fnc_questCompleted;
				};
			};
		};
	case (_item in ["steriods"]):
		{
		closeDialog 0;
		sleep 0.2;
		["steriods",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will increase your carry weight to 500kg for one hour. Re logging will end this timer?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["steriods",true,1] call DS_fnc_handleInventory;};
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
		};
	case (_item in ["noRecoil"]):
		{
		closeDialog 0;
		sleep 0.2;
		["noRecoil",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will remove your recoil for 10 minutes, Re Logging will cancel this buff. Continue?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["noRecoil",true,1] call DS_fnc_handleInventory;};
		[] spawn
			{
			_time = time + 600;
			_recoil = unitRecoilCoefficient player;
			while{true}do
				{
				player setUnitRecoilCoefficient 0;
				sleep 10;
				if(time > _time)exitwith{};
				};
			hint "Your Recoil Buff has worn off";
			systemChat "Your Recoil Buff has worn off";
			player setUnitRecoilCoefficient _recoil;
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
		_vehicle setVariable["vehicle_owners",[[getPlayerUID player,profileName,player]],true];
		DS_keyRing pushBack _vehicle;
		if((DS_infoArray select 17) == 36)then{[2] call DS_fnc_questCompleted;};
		};
	case (_item in ["meth"]):
		{
		if((DS_infoArray select 15) < 37)exitwith{hint "You can not use this item through this menu\n\nIf you're trying to use a vehicle item, press your windows key on the vehicle to bring up the vehicle interaction menu";};
		closeDialog 0;
		sleep 0.2;
		["meth",false,1] call DS_fnc_handleInventory;
		_action = false;
		_action = [
				"This item will remove your recoil for 5 minutes, Re Logging will cancel this buff. Continue?",
				"Warning",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
		if(!_action)exitwith{["meth",true,1] call DS_fnc_handleInventory;};
		[] spawn
			{
			_time = time + 300;
			_recoil = unitRecoilCoefficient player;
			while{true}do
				{
				player setUnitRecoilCoefficient 0;
				sleep 10;
				if(time > _time)exitwith{};
				};
			hint "Your Recoil Buff has worn off";
			systemChat "Your Recoil Buff has worn off";
			player setUnitRecoilCoefficient _recoil;
			};
		};
	default
	{
		hint "You can not use this item through this menu\n\nIf you're trying to use a vehicle item, press your windows key on the vehicle to bring up the vehicle interaction menu";
	};
};

closeDialog 0;	
[] call DS_fnc_menuPlayer;
[] call DS_fnc_updateHud;