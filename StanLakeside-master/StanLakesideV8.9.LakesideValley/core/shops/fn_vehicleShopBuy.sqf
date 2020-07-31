/*
	File: fn_vehicleShopBuy.sqf
	
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) isEqualTo -1) exitWith {[localize "STR_Shop_Veh_DidntPick", false] spawn domsg;};
_className = lbData[2302,(lbCurSel 2302)];
if(_className in ["Jonzie_Transit","Jonzie_Tow_Truck", "Jonzie_Flat_Bed", "Jonzie_Log_Truck", "Jonzie_Tanker_Truck", "Jonzie_Box_Truck"]) exitWith {
	[_className,_mode] call life_fnc_createTruckColorUI;
};
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; 
_basePrice = (_vehicleList select _vIndex) select 1;
_baseprice = _baseprice / 10;
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(cash_in_hand < _basePrice) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_basePrice - cash_in_hand] call life_fnc_numberText], false] spawn domsg;};

if(side player != west) then {
	if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {[localize "STR_Shop_Veh_NoLicense", false] spawn domsg;};
};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) isEqualTo "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],20]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints isEqualTo typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint isEqualTo "") exitWith {[localize "STR_Shop_Veh_Block", false] spawn domsg;};
["cash","take",_basePrice] call life_fnc_handleCash; 
[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText], false] spawn domsg;
[player,"buycarniggah"] spawn life_fnc_nearestSound;
_obj = ObjNull;
//Spawn the vehicle and prep it.
if((life_veh_shop select 0) isEqualTo "med_air_hs") then {
	if(_spawnPoint in ["med_air_2", "med_air_2_1"]) then {
		_obj = nearestObject [getMarkerPos _spawnPoint, "Land_pier_box_f"];
		_vehicle = createVehicle [_className, _obj modelToWorld [0,0,25.8], [], 0, "NONE"];
	} else {
		_vehicle = createVehicle [_className, getMarkerPos _spawnPoint, [], 0, "NONE"];
	};
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	if(_spawnPoint in ["med_air_2", "med_air_2_1"]) then {
		_vehicle setPosATL (_obj modelToWorld [0,0,25.8]);
	} else {
		_vehicle setPos (getMarkerPos _spawnPoint);
	};
	[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};

	case east: {
		if(_className isEqualTo "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	
	case civilian: {
		if(_className isEqualTo "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle; //Add err to the chain.
if(_mode) then {
	[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["TON_fnc_vehicleCreate",(call life_fnc_HCC)];
};
closeDialog 0; //Exit the menu.
true;
