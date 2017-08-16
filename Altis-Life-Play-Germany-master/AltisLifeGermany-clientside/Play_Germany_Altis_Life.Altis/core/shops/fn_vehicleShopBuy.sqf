#include <macro.h>
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: RafiQuak for PlayGermany

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_shopSide","_license"];
_mode = SEL(_this,0);
if((lbCurSel 2302) == -1) exitWith {
	hint localize "STR_Shop_Veh_DidntPick";
	[localize "STR_Shop_Veh_DidntPick", -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
};
_don = lbData[2304,(lbCurSel 2304)];
if((_don isEqualTo "don") && {FETCH_CONST(life_donatorlevel) < 1}) exitWith {
	["Dieser Skinn ist leider unseren Spendern vorbehalten", -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
};

_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];

_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",SEL(life_veh_shop,0),"side");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);

 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {["ERROR please report at http://bugs.play-germany.de", -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;}; //Bad price entry
_basePrice = _basePrice * PG_donGoalMulti;
if(CASH < _basePrice) exitWith {
	hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call life_fnc_numberText];
	[format[localize "STR_Shop_Veh_NotEnoughDT",[_basePrice - CASH] call life_fnc_numberText], -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
};

_license = SEL(SEL(_vehicleList,_vIndex),2);
if(!(EQUAL(_license,"")) && {!(LICENSE_VALUE(_license,_shopSide))}) exitWith {
	hint localize "STR_Shop_Veh_NoLicense";
	[localize "STR_Shop_Veh_NoLicense", -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
};

_spawnPoints = SEL(life_veh_shop,1);
_spawnPoint = "";

if((SEL(life_veh_shop,0) in ["med_air_hs","thw_air_hs"])) then {
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


if(EQUAL(_spawnPoint,"")) exitWith {
	hint localize "STR_Shop_Veh_Block";
	[localize "STR_Shop_Veh_Block", -1, 0.7, 5, 0, 0, 11126] spawn BIS_fnc_dynamicText;
};
SUB(CASH,_basePrice);
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) in ["med_air_hs","thw_air_hs"]) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	if (isNil "_hs") then {
		_vehicle setPos (getMarkerPos _spawnPoint);
	} else {
		_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	};
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
};


_vehicle lock 2;
[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
[_vehicle] call life_fnc_clearVehicleAmmo;
[[_vehicle,"trunk_in_use","",true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;

//Thermals
if(!(typeof _vehicle in ["I_Heli_light_03_unarmed_F","I_MRAP_03_F"])) then {
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle disableTIEquipment false; //Thermals.. They're cheap but addictive.
};

//Antirope
if(typeof _vehicle in ["B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_F"]) then {
	_vehicle enableRopeAttach true;
	_vehicle setVariable["RopeAttach",true,true];
} else {
	_vehicle enableRopeAttach false;
	_vehicle setVariable["RopeAttach",false,true];
};

_vehicle setVariable["lights",false,true];
//new light system
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F":
		{
			if(_colorIndex in [10,11,12,13,14,16]) then {
				_vehicle setVariable ["undercover",false,true];
			} else {
				_vehicle setVariable ["undercover",true,true];
			};
		};

		case "B_G_Offroad_01_F":
		{
			if(_colorIndex in [0]) then {
				_vehicle setVariable ["undercover",false,true];
			} else {
				_vehicle setVariable ["undercover",true,true];
			};
		};

		case "C_SUV_01_F":
		{
			if(_colorIndex in [9,10,11,12,13,14]) then {
				_vehicle setVariable ["undercover",false,true];
				_lamp = ("Land_runway_edgelight_blue_F" createVehicle [0,0,0]);
				_vehicle setVariable ["lamp",_lamp, true];
				_lamp attachTo[_vehicle,[-0.61,-0.6,0.32]];
			} else {
				_vehicle setVariable ["undercover",true,true];
			};
		};

		case "C_Hatchback_01_F":
		{
			if(_colorIndex in [10,11,12]) then {
				_vehicle setVariable ["undercover",false,true];
				_lamp = ("Land_runway_edgelight_blue_F" createVehicle [0,0,0]);
				_vehicle setVariable ["lamp",_lamp, true];
				_lamp attachTo[_vehicle,[-0.55,-0.6,0.16]];
			} else {
				_vehicle setVariable ["undercover",true,true];
			};
		};

		case "C_Hatchback_01_sport_F":
		{
			if(_colorIndex in [7,8,9]) then {
				_vehicle setVariable ["undercover",false,true];
				_lamp = ("Land_runway_edgelight_blue_F" createVehicle [0,0,0]);
				_vehicle setVariable ["lamp",_lamp, true];
				_lamp attachTo[_vehicle,[-0.55,-0.6,0.16]];
			} else {
				_vehicle setVariable ["undercover",true,true];
			};
		};

		case "B_Truck_01_transport_F":
		{
			if(_colorIndex in [3,4]) then {
				_vehicle setVariable ["undercover",false,true];
				_lamp = ("Land_Flush_Light_yellow_F" createVehicle [0,0,0]);
				_vehicle setVariable ["lamp",_lamp, true];
				_lamp attachTo[_vehicle,[0.07,4.04,0.5]];
			};
		};

		default
		{
			_vehicle setVariable ["undercover",false,true];
		};
	};

//Updatefix...
if(typeOf _vehicle == "C_Offroad_01_F") then {
	_vehicle animate ["HideConstruction", 1];
	_vehicle animate ["HideBumper1", 1];
	_vehicle animate ["HideBumper2", 1];
};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		switch (_className) do {
			case "C_Offroad_01_F": {
				if(EQUAL(_colorIndex,14)) then {
					[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",player,false] call life_fnc_MP;
				};
			};
			case "B_G_Offroad_01_F": {
				[[_vehicle,"jaeger_offroad",true],"life_fnc_vehicleAnimate",player,false] call life_fnc_MP;
			};
			if((EQUAL(_className,"C_Offroad_01_F")) && {_colorIndex in [17,19]}) then {
				[_vehicle,"twitch",true] spawn life_fnc_vehicleAnimate;
			};
		};
	};

	case civilian: {
		if(EQUAL(_className,"B_Heli_Light_01_F")) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if((EQUAL(_className,"C_Offroad_01_F")) && {_colorIndex in [17,19]}) then {
			[_vehicle,"twitch",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		if(EQUAL(_className,"C_Offroad_01_F")) then {
			if(_colorIndex in [10,11,16,12,13]) then {
				[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",player,false] call life_fnc_MP;
			};
		};
	};
};

_vehicle allowDamage true;
[[_vehicle], "PG_fnc_vehicleAddEVH", true, true] spawn life_fnc_MP;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

if(_mode) then {
	if(!((_className in (LIFE_SETTINGS(getArray,"vehicleShop_donatorOnly"))) && (!license_civ_donator)) || (playerSide != civilian)) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
	};
};

[] call life_fnc_hudUpdate;
[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;