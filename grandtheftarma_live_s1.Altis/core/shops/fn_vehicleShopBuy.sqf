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
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(!_mode) then {_basePrice = round(_basePrice / 2)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(GTA_money_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - GTA_money_cash] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

//--- Helicopter buy warning
if (
  playerSide == civilian
  && {_mode}
  && {_className isKindOf "Helicopter"}
  && {!([localize "STR_GTA_MISC_HELI_PURCHASE_WARNING", "Warning", "Yes", "No"] call BIS_fnc_guiMessage)}
) exitWith {};

//--- Fuel truck warning
if (
  playerSide == civilian
  && {[_className, ["B_Truck_01_fuel_F", "Truck_02_fuel_base_F", "O_Truck_03_fuel_F"]] call GTA_fnc_isKindOf}
  && {!([localize "STR_GTA_MISC_FUELTRUCK_PURCHASE_WARNING", "Warning", "Continue", "Cancel"] call BIS_fnc_guiMessage)}
) exitWith {};

//--- Rent warning
if (
  playerSide == civilian
  && {!_mode}
  && {!([localize "STR_GTA_MISC_RENT_WARNING", "Warning", "Yes", "No"] call BIS_fnc_guiMessage)}
) exitWith {};

//--- Container warning
if (
  playerSide == civilian
  && {_mode}
  && {_className isKindOf "Slingload_01_Base_F"}
  && {!([localize "STR_GTA_MISC_BUY_CONTAINER_WARNING", "Warning", "Yes", "No"] call BIS_fnc_guiMessage)}
) exitWith {};

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
GTA_money_cash = GTA_money_cash - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {

	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];

	//--- Disable texture randomisation
	_vehicle setVariable [ "BIS_enableRandomization", false ];

	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;

} else {

	//--- Raise spawn
	_sp = getMarkerPos _spawnPoint;
	_sp set [ 2, ( _sp select 2 ) + 0.6 ];

	_vehicle = createVehicle [_className, _sp, [], 0, "NONE"];

	//--- Disable texture randomisation
	_vehicle setVariable [ "BIS_enableRandomization", false ];
	_vehicle allowDamage false;
	_vehicle lock 2;
	_vehicle setDir (markerDir _spawnPoint);
	[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;

};

//--- Custom center of mass for SUV
/*if ( _className == "C_SUV_01_F" ) then {

	private "_centerOfMass";
	_centerOfMass = getCenterOfMass _vehicle;
	_centerOfMass set [ 2, -0.657 ];
	_vehicle setCenterOfMass _centerOfMass;

};*/

//--- Disable TI
if ( _vehicle isKindOf "Heli_Transport_04_base_F" ) then {

	_vehicle disableTIEquipment true;

};

//--- UAV AI
if ( [ _vehicle, [ "UGV_01_base_F", "UAV_02_base_F" ] ] call GTA_fnc_isKindOf ) then {

	createVehicleCrew _vehicle;

};

//--- Remove vehicle ammo cargo
_vehicle setAmmoCargo 0;
_vehicle setRepairCargo 0;

//--- Disarm the vehicle
_vehicle call GTA_fnc_disarmVehicle;

//--- Clear vehicle cargo
_vehicle call GTA_fnc_clearVehicleCargo;

//--- Vehicle vars
_vehicle setVariable ["vehicle_info_owners", [[getPlayerUID player, profileName]], true];

//--- Setup event handlers
[ [ _vehicle ], "GTA_fnc_vehicleEventHandlers", true ] call GTA_fnc_remoteExec;

//--- Animate
switch _className do {

	case "B_G_Offroad_01_F";
	case "B_G_Offroad_01_armed_F": {

		if ( [] call GTA_fnc_isMilitary ) then {

			_vehicle animate [ "HidePolice", 0 ];
			_vehicle animate [ "HideServices", 1 ];
			_vehicle animate [ "HideBackpacks", 0 ];
			_vehicle animate [ "HideBumper1", 1 ];
			_vehicle animate [ "HideBumper2", 0 ];
			_vehicle animate [ "HideConstruction", 0 ];
			_vehicle animate [ "HideDoor1", 0 ];
			_vehicle animate [ "HideDoor2", 0 ];
			_vehicle animate [ "HideDoor3", 0 ];
			_vehicle animate [ "HideGlass2", 1 ];

		};

	};

	case "I_Heli_light_03_F": {

		_vehicle animate [ "RocketPods", 1 ];

	};

	case "C_Heli_Light_01_civil_F": {

		_vehicle animate [ "AddDoors", 1 ];

	};

};

//--- Add toolkit & First Aid Kit
_vehicle addItemCargoGlobal [ "Toolkit", 1 ];
_vehicle addItemCargoGlobal [ "FirstAidKit", 1 ];

_vehicle allowDamage true;

//--- Add to vehicle chain
life_vehicles pushBack _vehicle;

if ( _mode ) then {

	[ [ getPlayerUID player, player, playerSide, _vehicle, _colorIndex ], "TON_fnc_vehicleCreate", false, false ] call GTA_fnc_remoteExec;

} else {
	//--- TODO: for cleanup manager
  _vehicle setVariable ["vehicle_owner", getPlayerUID player, true];
};

[0] call GTA_fnc_updatePlayerPartial;
closeDialog 0; //Exit the menu.
true;
