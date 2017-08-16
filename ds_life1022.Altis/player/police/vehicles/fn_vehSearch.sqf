/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks vehicles inventory for illegal stuffs
*/

private ["_vehicle","_convoy","_bootInfo","_value","_tempValue","_class","_amount","_action","_bulletProof","_targets"];

_vehicle = DS_cursorTarget;
if(isNull _vehicle)exitwith{};
_convoy = false;
_bulletProof = false;

_action = [
	"Are you sure you want to search this vehicle, remember if this search is illegal you will be required to compensate the owner",
	"Search Vehicle",
	"Search",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {};

_heroinPrice = DS_sellArray select 27;
_weedPrice = DS_sellArray select 28;
_cocainePrice = DS_sellArray select 29;
_relicPrice = DS_sellArray select 34;
_methPrice = DS_sellArray select 39;
_chemPrice = 100;
_goldPrice = 60000;
_spyDocsPrice = 60000;
_chempackPrice = 2000;

hint "Searching vehicle\n\nPlease wait...";

_bootInfo = _vehicle getVariable ["boot",[]];
if((_vehicle getVariable ["convoy_truck",false]))then{_convoy = true};
if(DS_copLevel > 5)then
	{
	if(_bootInfo isEqualTo [])then
		{
			systemchat "Boot Cargo <empty> || <empty>";
		}
		else
		{
			systemchat format ["Boot Cargo %1 || %2",_bootInfo select 0,_bootInfo select 1];
		};
	};
_value = 0;
_tempValue = 0;


if(count(_bootInfo select 0) > 0)then
	{
		{
			if((_x select 0) == "heroinp")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_heroinPrice);
				};
			if((_x select 0) == "weedp")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_weedPrice);
				};
			if((_x select 0) == "cocainep")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_cocainePrice);
				};
			if((_x select 0) == "heroinu")then
				{
				_tempValue = _x select 1;
				_value = _value + round((_tempValue*_heroinPrice)/3);
				};
			if((_x select 0) == "weedu")then
				{
				_tempValue = _x select 1;
				_value = _value + round((_tempValue*_weedPrice)/3);
				};
			if((_x select 0) == "cocaineu")then
				{
				_tempValue = _x select 1;
				_value = _value + round((_tempValue*_cocainePrice)/3);
				};
			if((_x select 0) == "illegalRelicu")then
				{
				_tempValue = _x select 1;
				_value = _value + round((_tempValue*_relicPrice)/3);
				};
			if((_x select 0) == "illegalRelicp")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_relicPrice);
				};
			if(((_x select 0) == "hydro")||((_x select 0) == "sodium"))then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_chemPrice);
				};
			if(((_x select 0) == "hydroPack")||((_x select 0) == "sodiumPack"))then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_chempackPrice);
				};
			if((_x select 0) == "meth")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_methPrice);
				};
			if((_x select 0) == "goldBar")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_goldPrice);
				};
			if((_x select 0) == "spyDocs")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*_spyDocsPrice);
				};
			if((_x select 0) == "battery")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*12000);
				};
			if((_x select 0) == "cracker")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*10000);
				};
			if((_x select 0) == "bpGunLynx")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*1000);
				};
			if((_x select 0) == "gunLynx")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*12000);
				};
			if((_x select 0) == "gunLynxAdv")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*15000);
				};
			if((_x select 0) == "bpAmmoLynx")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*1500);
				};
			if((_x select 0) == "ammoLynx")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*500);
				};
			if((_x select 0) == "ammoLynxAdv")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*650);
				};
			if((_x select 0) == "bpAmmoRpg")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*700);
				};
			if((_x select 0) == "ammoRpg")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*1500);
				};
			if((_x select 0) == "ied")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*25000);
				};
			if((_x select 0) == "bpGunRpg")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*820);
				};
			if((_x select 0) == "gunRpg")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*4250);
				};
			if((_x select 0) == "bpGun3gl")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*400);
				};
			if((_x select 0) == "gun3gl")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*2200);
				};
			if((_x select 0) == "bpGunNavid")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*600);
				};
			if((_x select 0) == "gunNavid")then
				{
				_tempValue = _x select 1;
				_value = _value + (_tempValue*3600);
				};
		}forEach (_bootInfo select 0) select 0;
	};

if(_vehicle getVariable ["bulletProof",false])exitWith
	{
	hint "!~WARNING~!\n\nThis vehicle has a bullet proof cabin, this is a highly illegal civilian modification\n\n\nYou have permission to have this vehicle destroyed";
	if((DS_infoArray select 21) == 5)then { [3] call DS_fnc_questCompleted };
	};

if(_vehicle getVariable ["carBomb",false])exitWith
	{
	hint "!~WARNING~!\n\nThis vehicle is rigged to explode\n\n\nYou have permission to have this vehicle destroyed";
	if((DS_infoArray select 21) == 5)then { [3] call DS_fnc_questCompleted };
	};

if(_value == 0)then
	{
	if(_convoy)then
		{
		hint "Nothing illegal in this vehicle.\n\n\n\n!~WARNING~!\n\nThis vehicle has been used to transport weapons, drugs or illegal cargo\n\n\nDestroy it for the entire police force to receive a reward";
		if((DS_infoArray select 21) == 5)then { [3] call DS_fnc_questCompleted };
		}
		else
		{
		hint "Nothing illegal in this vehicle.";
		};
	}
	else
	{
	if((DS_infoArray select 21) == 5)then { [3] call DS_fnc_questCompleted };
	_targets = allPlayers select {(_x distance player) < 8000};
	[0,format["A searched vehicle revealed illegal items with an estimated street value of $%1.",[_value] call DS_fnc_numberText]] remoteExecCall ["DS_fnc_globalMessage",_targets];
	_numOfCops = {((side _x) isEqualTo west)&&(_x getVariable ["rankStr",""] != "Rent-A-Cop")} count allPlayers;
	_value = round(_value/_numOfCops);
	_targets = allPlayers select {((side _x) isEqualTo west)&&(_x getVariable ["rankStr",""] != "Rent-A-Cop")};
	[_value,"Confiscated illegal goods from a vehicle",name player] remoteExec ["DS_fnc_copRewards",_targets];
	//hint format ["You have received $%1 as a reward for searching this vehicle",(round(_value/2))];
	//[(round(_value/2)),true,true] call DS_fnc_handleMoney;
	_vehicle setVariable["boot",[],true];
	[(round(_value/4)),true] remoteExec ["HUNT_fnc_policeBank",2];
	};