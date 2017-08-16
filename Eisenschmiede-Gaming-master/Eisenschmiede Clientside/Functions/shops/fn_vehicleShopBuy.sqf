#include "..\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_shopSide","_license","_exit"];
_mode = SEL(_this,0);
_exit = false;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(ES_veh_shop,0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",SEL(ES_veh_shop,0),"side");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);
_licenses = SEL(SEL(_vehicleList,_vIndex),2);

 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(ES_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - ES_cash] call ES_fnc_numberText];};

{
	if(!(EQUAL(_x,"")) && {!(LICENSE_VALUE(_x,_shopSide))}) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
} foreach _licenses;
if(_exit) exitWith {};

_spawnPoints = SEL(ES_veh_shop,1);
_spawnPoint = "";

if((SEL(ES_veh_shop,0) == "med_air_hs")) then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(EQUAL(typeName _spawnPoints,typeName [])) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(EQUAL(_spawnPoint,"")) exitWith {hint localize "STR_Shop_Veh_Block";};
ES_cash = ES_cash - _basePrice;
playSound "kaufen";
["Fahrzeugkauf"] call ES_fnc_xp_add;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call ES_fnc_numberText];
_toLog = format ["Name: %1 (%2) hat Fahrzeug: %3 für: %4 $ gekauft", player getVariable["realname",name player], getPlayerUID player, getText(configFile >> "CfgVehicles" >> _className >> "displayName"), [_basePrice] call ES_fnc_numberText];
["FAHRZEUG_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

//Spawn the vehicle and prep it.
if((ES_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteExec ["ES_fnc_colorVehicle",-2];
	[_vehicle] call ES_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["ES_fnc_setObjVar",2];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["ES_fnc_setObjVar",2];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[_vehicle,_colorIndex] remoteExec ["ES_fnc_colorVehicle",-2];
	[_vehicle] call ES_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["ES_fnc_setObjVar",2];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["ES_fnc_setObjVar",2];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn ES_fnc_vehicleAnimate;
	};
	
	case civilian: {
		if(EQUAL(SEL(ES_veh_shop,2),"civ") && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn ES_fnc_vehicleAnimate;
		};
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn ES_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;
_vehicle setDamage 0.01;
_vehicle setDamage 0;

//ES_vehicles set[count ES_vehicles,_vehicle]; //Add err to the chain.
ES_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"ES_fnc_keyManagement",2];

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExec ["ES_fnc_vehicleCreate",2];
	};
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;