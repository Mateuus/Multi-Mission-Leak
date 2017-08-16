/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_LKW"];
_mode = _this select 0;
if((life_nottoofast != 0) && ((time - life_nottoofast) < 0.2)) exitWith {};
life_nottoofast = time;

_LKW = ["I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_fuel_F","I_Truck_02_box_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_device_F","O_Truck_02_fuel_F","O_Truck_03_ammo_F"];

if((lbCurSel 2302) == -1) exitWith {["Oh nein!",localize "STR_Shop_Veh_DidntPick","#ff1000","#ffffff",4] call life_fnc_texttiles;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
//_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; 
//_basePrice = (_vehicleList select _vIndex) select 1;
_basePrice = [_classname,playerside] call life_fnc_classPrices;

if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];
//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_beatgeld < _basePrice) exitWith {["Oh nein!",format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_beatgeld] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {["Oh nein!",localize "STR_Shop_Veh_NoLicense","#ff1000","#ffffff",4] call life_fnc_texttiles;};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
_whitelist = ["cop_air_2","cop_air_3","cop_air_hw","autobahn1_heli","autobahn2_heli","med_air_1","med_air_2"];

if((life_veh_shop select 0) in ["med_air","cop_air","reb_v_4"] && !(_spawnPoints in _whitelist)) then 
{
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],50]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {["Oh nein!",localize "STR_Shop_Veh_Block","#ff1000","#ffffff",4] call life_fnc_texttiles;};
life_beatgeld = life_beatgeld - _basePrice;
["Yeah!",format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText],"#ff1000","#ffffff",4] call life_fnc_texttiles;

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) in ["med_air","cop_air","reb_v_4"] && !(_spawnPoints in _whitelist)) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,11.5]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle",0];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true]; //[_vehicle,"trunk_in_use",false,true] remoteExecCall ["SOA_fnc_setObjVar",2];
	_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true]; //[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["SOA_fnc_setObjVar",2];
	_vehicle disableTIEquipment true;
	
} else {

	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"};
	_vehicle allowDamage false;
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle",0];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true];
	_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle disableTIEquipment true;
};

//Disable ropes
if(_classname in ["B_Heli_Transport_03_unarmed_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Ammo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F"]) then {
	_vehicle enableRopeAttach true;
} else {
	_vehicle enableRopeAttach false;
};

_vehicle setVariable ["versichert",false];
//_vehicle addEventHandler["Engine",{_this spawn life_fnc_fuel}];

//add medikit and repairkit
_vehicle addItemCargoGlobal ["FirstAidKit", 1];
_vehicle addItemCargoGlobal ["ToolKit", 1];

//Side Specific actions.
switch(playerSide) do {

	case west: 
	{
		if(_classname == "C_Offroad_01_F") then {
			[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_Offroad_02_unarmed_F") then {
			[_vehicle,"cop_jeep",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_SUV_01_F" && _colorIndex == 1) then {
			[_vehicle,"cop_suv",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_SUV_01_F" && _colorIndex == 4) then {
			[_vehicle,"cop_suv_bund",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname in ["C_Hatchback_01_F","C_Hatchback_01_sport_F"]) then {
			[_vehicle,"cop_limo",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "I_MRAP_03_F") then {
			[_vehicle,"cop_strider",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "B_MRAP_01_F") then {
			[_vehicle,"cop_hunter",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_Quadbike_01_F") then {
			[_vehicle,"cop_quad",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "I_Truck_02_covered_F") then {
			[_vehicle,"cop_zamak",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case civilian: 
	{
		if((life_veh_shop select 2) == "civ" && _className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "B_Plane_CAS_01_F") then {
			[_vehicle,_colorIndex] call life_fnc_flugzeug;
			if(!erfolg_flieger) then {erfolg_flieger = true; ["erfolg_flieger"] spawn life_fnc_erfolgerhalten};
		};

		if(_classname == "C_Quadbike_01_black_F") then {
			[_vehicle] call life_fnc_erollator;
		};

		if(_classname in ["C_Offroad_01_F"]) then {
			[_vehicle,"civ_offroad",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case independent: 
	{
		if(_classname == "C_Offroad_01_F") then {
			[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_Offroad_02_unarmed_F") then {
			[_vehicle,"ahw_jeep",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_SUV_01_F") then {
			[_vehicle,"ahw_suv",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "I_G_Offroad_01_F") then {
			[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "C_Van_01_box_F") then {
			[_vehicle,"ahw_van",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "I_Truck_02_box_F") then {
			[_vehicle,"ahw_zamak",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "I_Truck_02_covered_F") then {
			[_vehicle,"ahw_zamaktransport",true] spawn life_fnc_vehicleAnimate;
		};

		if(_classname == "B_Truck_01_mover_F") then {
			[_vehicle,"ahw_hemtt",true] spawn life_fnc_vehicleAnimate;
		};
	};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["SOA_fnc_keyManagement",2];

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["SOA_fnc_vehicleCreate",2];
	};	
};

[name player, [_basePrice] call life_fnc_numberText,typeOf _vehicle,11] remoteExecCall ["life_fnc_logdat",2];

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;

if((_classname in _LKW) && !erfolg_brummi) then {erfolg_brummi = true; ["erfolg_brummi"] spawn life_fnc_erfolgerhalten; sleep 5};

if(life_veh_kfz == "") then {
	[0] call life_fnc_kfzproof;
	Waituntil{life_veh_kfz != ""};
	[_vehicle] call life_fnc_kennzeichen;
} else {
	_vehicle call life_fnc_kennzeichenCheck;
};

_vehicle spawn life_fnc_versicherungCheck;