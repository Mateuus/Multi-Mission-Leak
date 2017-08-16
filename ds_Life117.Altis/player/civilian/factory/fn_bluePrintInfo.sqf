/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Displays information about each blue print
*/
private ["_fail","_bluePrint","_str","_infoArray","_mattString","_name","_longName"];
_bluePrint = _this select 0;
_longName = format ["DS_item_%1",_bluePrint];
_fail = false;
if(!([_longName,"matt"] call KRON_StrInStr))then
	{
	if(missionNameSpace getVariable _longName < 1)exitwith{hint "You do not have this blue print, purchase it from the blue print shop";_fail = true;};
	};
if(_fail)exitwith{};
if((DS_infoArray select 13) == 16)then
	{
	[0] call DS_fnc_questCompleted;
	};

switch(_bluePrint)do
	{
	case "bpVehSecurity":
		{_infoArray = [
			"Land Vehicle Security Upgrade",
			"Apply this to a vehicle to enhance the vehicles security, allowing you to unlock it via remote at a distance, adds GPS marker of the vehicle and making the vehicle difficult to lockpick",
			"Super Security Upgrade",
			"Enhances a vehicles security system to a point where lock picking is impossible",
			3,
			[["mattCpu",1],["mattSmallBattery",1],["mattCrystalGlass",1],["mattCircuitBoard",1]]
			];
		};
	case "bpVehWeight":
		{_infoArray = [
			"Land Vehicle Capacity Upgrade",
			"Apply this to a vehicle in addition to a current capacity upgrade, allowing you to store even more inside of the vehicles boot",
			"Super Capacity Upgrade",
			"Rather than a 50% increase this doubles the vehicles carry weight",
			3,
			[["mattSteel",5],["mattTreatedLumber",3]]
			];
		};
	case "bpVehFuel":
		{_infoArray = [
			"Land Vehicle Fuel Upgrade",
			"Apply this to a vehicle to decrease its fuel consumption",
			"Super Vehicle Fuel Upgrade",
		"The vehicle will use half the fuel amount and fuel darts will have a much higher miss rate",
			3,
			[["mattSteel",12],["oilp",20]]
			];
		};
	case "bpThermal":
		{_infoArray = [
			"Vehicle Thermal Upgrade (SINGLE USE ITEM)",
			"Apply this to a vehicle to give it thermal vision abilities",
			"",
			"",
			0,
			[["battery",3],["mattCrystalGlass",4],["sodium",40],["mattCircuitBoard",20],["mattCpu",20]]
			];
		};
	case "bpWeaponsAir":
		{_infoArray = [
			"Air Vehicle Ammo Upgrade (SINGLE USE ITEM)",
			"Apply this to an air vehicle to enhance its weapons",
			"",
			"",
			0,
			[["vehAmmo",2],["mattCrystalGlass",1],["mattSteel",100],["mattCircuitBoard",10],["mattCpu",10]]
			];
		};
	case "bpWeaponsLand":
		{_infoArray = [
			"Land Vehicle Ammo Upgrade (SINGLE USE ITEM)",
			"Apply this to a land vehicle to enhance its weapons",
			"",
			"",
			0,
			[["cracker",10],["mattCrystalGlass",1],["mattSteel",50],["mattCircuitBoard",1],["mattCpu",1]]
			];
		};
	case "bpBlackfoot":
		{_infoArray = [
			"Blackfoot Chopper",
			"Armed Blackfoot chopper (Can not insure)",
			"",
			"",
			0,
			[["mattSteel",300],["mattCrystalGlass",50],["battery",5],["pawnee",2],["mattCircuitBoard",20],["mattCpu",20]]
			];
		};
	case "bpVehNos":
		{_infoArray = [
			"Land Vehicle Nos Upgrade",
			"Apply this to a vehicle to give it a temporary nitro boost",
			"10 Use Nos Kit",
			"A Nos kit that can be used 10 times",
			3,
			[["hydro",4],["oilp",5],["mattSteel",3]]
			];
		};
	case "bpGunLynx":
		{_infoArray = [
			"Lynx",
			"Long Ranged Sniper Rifle",
			"LRPS Lynx",
			"Long Ranged Sniper Rifle with default LRPS Attachment",
			3,
			[["mattSteel",20],["mattBronze",5],["mattCrystalGlass",2]]
			];
		};
	case "bpAmmoLynx":
		{_infoArray = [
			"APDS Lynx Rounds",
			"Armour Penetrating Lynx Ammo",
			"5 APDS Lynx Rounds",
			"5 Armour Penetrating Lynx Ammo",
			5,
			[["mattSteel",1],["mattBronze",1]]
			];
		};
	case "bpAmmoRpg":
		{_infoArray = [
			"RPG HE Rocket",
			"HE Rocket fired from an RPG",
			"RPG AP Round",
			"Armour Penetrating RPG Rocket",
			3,
			[["mattSteel",2],["mattBronze",1]]
			];
		};
	case "bpGunRpg":
		{_infoArray = [
			"RPG Launcher",
			"Launcher used to fire an RPG",
			"",
			"",
			0,
			[["mattSteel",10],["mattBronze",5],["mattCircuitBoard",2],["mattCrystalGlass",4]]
			];
		};
	case "bpGun3gl":
		{_infoArray = [
			"MX Grenade Launcher",
			"MX Automatic Rifle, Also able to fire grenades",
			"",
			"",
			0,
			[["mattSteel",8],["mattBronze",4],["oilp",5],["mattCrystalGlass",2]]
			];
		};
	case "bpGunNavid":
		{_infoArray = [
			"Navid 9.3mm",
			"Navid Medium Machine Gun",
			"",
			"",
			0,
			[["mattSteel",2],["mattBronze",10],["oilp",6]]
			];
		};
	case "bpAmmoRpg":
		{_infoArray = [
			"RPG HE Rocket",
			"HE Rocket fired from an RPG",
			"RPG AP Round",
			"Armour Penetrating RPG Rocket",
			3,
			[["mattSteel",2],["mattBronze",1]]
			];
		};
	case "bpVehSUV":
		{_infoArray = [
			"Bulletproof SUV (SINGLE USE ITEM)",
			"An SUV with a bulletproof cabin",
			"",
			"",
			0,
			[["mattSteel",200],["mattCrystalGlass",20],["mattBronze",50],["mattSmallBattery",12],["mattCircuitBoard",20],["mattCpu",20],["oilp",20]]
			];
		};
	case "mattSmallBattery":
		{_infoArray = [
			"Small Battery",
			"A battery used inside electronic items",
			"",
			"",
			0,
			[["hydro",10],["mattBronze",1],["ironp",2]]
			];
		};
	case "mattCircuitBoard":
		{_infoArray = [
			"Circuit Board",
			"A vital part required for items involving electricity",
			"",
			"",
			0,
			[["copperp",10],["oilp",3],["hydro",4]]
			];
		};
	case "mattBronze":
		{_infoArray = [
			"Bronze",
			"A copper alloy",
			"",
			"",
			0,
			[["ironp",2],["copperp",3]]
			];
		};
	case "mattCrystalGlass":
		{_infoArray = [
			"Crystal Glass",
			"A high grade glass used in construction",
			"",
			"",
			0,
			[["sandp",3],["copperp",2]]
			];
		};
	case "mattSteel":
		{_infoArray = [
			"Steel",
			"Hardened Steel",
			"",
			"",
			0,
			[["ironp",3],["oilp",1]]
			];
		};
	case "mattTreatedLumber":
		{_infoArray = [
			"Hardened Lumber",
			"Hardened Lumber",
			"",
			"",
			0,
			[["woodp",3],["oilp",1]]
			];
		};
	case "mattCpu":
		{_infoArray = [
			"CPU",
			"A computer chip required to make technical equipment",
			"",
			"",
			0,
			[["mattCircuitBoard",2],["mattCrystalGlass",1],["copperp",10]]
			];
		};
	};
if((_infoArray select 2) == "")then
	{
	_infoArray set [3,"This item has no critical success product"];
	};
	
_mattString = "";	
{
	_name = [(_x select 0)] call DS_fnc_itemStringConfig;
	_mattString = _mattString + format ["%1 x %2<br/>",(_x select 1),_name];
}forEach (_infoArray select 5);
	
_str = parseText format ["<t color='#4CCF00' size='1.5'>Blueprint information</t><br/><br/>
<t color='#FFFF00'>Product</t><br/>%1<br/><br/>
<t color='#D7DF01'>Description</t><br/>%2<br/><br/>
<t color='#FF0000'>Critical Success Product</t><br/>%3<br/><br/>
<t color='#DF0101'>Critical Success Description</t><br/>%4<br/><br/>
<t color='#DF0101'>Critical Success Chance</t><br/>%5 Percent<br/><br/><br/>
<t color='#00FF00'>Required Parts to create this product</t><br/><br/>
<t color='#00BFFF'>%6</t><br/>
"
,(_infoArray select 0)
,(_infoArray select 1)
,(_infoArray select 2)
,(_infoArray select 3)
,((_infoArray select 4)*(DS_infoArray select 30))
,_mattString
];

hint _str;







