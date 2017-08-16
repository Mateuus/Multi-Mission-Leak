/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call tanoarpg_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_atmcash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_atmcash] call tanoarpg_fnc_numberText];};
if(!([_className] call tanoarpg_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
life_atmcash = life_atmcash - _basePrice;
[1] call XAS_fnc_updatePartial;	//ANTI GELDGLITCH SCRIPT !!!!!
[player, player, _basePrice, "VEHICLEBOUGHT", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];

hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call tanoarpg_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteExec ["tanoarpg_fnc_colorVehicle", -2, true];
	[_vehicle] call tanoarpg_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TEX_fnc_setObjVar", 2, false];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TEX_fnc_setObjVar", 2, false];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[_vehicle,_colorIndex] remoteExec ["tanoarpg_fnc_colorVehicle", -2, true];
	[_vehicle] call tanoarpg_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TEX_fnc_setObjVar", 2, false];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TEX_fnc_setObjVar", 2, false];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn tanoarpg_fnc_vehicleAnimate;
		
		if(_className == "B_Truck_01_mover_F") then {
			_parts = "Land_City_Pillar_F" createVehicle [0,0,0];
			_vehicle setVariable ["a2", _parts, TRUE];
	
			_parts = "Land_City_Pillar_F" createVehicle [0,0,0];
			_vehicle setVariable ["a3", _parts, TRUE];
	
			_parts = "Land_City_Pillar_F" createVehicle [0,0,0];
			_vehicle setVariable ["a4", _parts, TRUE];
	
			_parts = "Land_MobileLandingPlatform_01_F" createVehicle [0,0,0];
			_vehicle setVariable ["a1", _parts, TRUE];
	
			_parts = "Land_Crash_barrier_F" createVehicle [0,0,0];
			_vehicle setVariable ["a7", _parts, TRUE];
	
			_parts = "Land_PierLadder_F" createVehicle [0,0,0];
			_vehicle setVariable ["a5", _parts, TRUE];
	
			_parts = "Land_PortableLight_double_F" createVehicle [0,0,0];
			_vehicle setVariable ["a6", _parts, TRUE];
			
			[_vehicle,"cop_hemmit",true] remoteExec ["tanoarpg_fnc_vehicleAnimate", -2, true];
		};
		
		if(_className == "C_Boat_Civil_04_F") then {
            [_vehicle,"boat_trawler",true] spawn tanoarpg_fnc_vehicleAnimate;
        };
	};
	
	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn tanoarpg_fnc_vehicleAnimate;
		};
		
		if((life_veh_shop select 2) == "civ" && (_className in ["C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F"])) then {
            [_vehicle,"civ_cart",true] spawn tanoarpg_fnc_vehicleAnimate;
        };
		
		if((life_veh_shop select 2) == "civ" && (_className == "C_Boat_Civil_04_F")) then {
            [_vehicle,"boat_trawler",true] spawn tanoarpg_fnc_vehicleAnimate;
        };
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn tanoarpg_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExec ["TEX_fnc_keyManagement", 2, false];

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExec ["TEX_fnc_vehicleCreate", 2, false];
	};
};

closeDialog 0; //Exit the menu.
true;