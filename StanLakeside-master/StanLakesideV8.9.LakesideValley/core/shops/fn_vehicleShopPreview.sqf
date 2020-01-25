/*
	File: fn_vehicleShopPreview.sqf
	
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_sp","_vh","_box","_offset"];
_mode = _this select 0;
if((lbCurSel 2302) isEqualTo -1) exitWith {[localize "STR_Shop_Veh_DidntPick", false] spawn domsg;};
_className = lbData[2302,(lbCurSel 2302)];
if(_className in ["Jonzie_Transit","Jonzie_Tow_Truck", "Jonzie_Flat_Bed", "Jonzie_Log_Truck", "Jonzie_Tanker_Truck", "Jonzie_Box_Truck"]) exitWith {
	[_className,_mode,true] call life_fnc_createTruckColorUI;
};
if(previewing_on) exitwith { ["Juz cos przegladasz!", false] spawn doquickmsg; };
previewing_on = true;
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; 
_basePrice = (_vehicleList select _vIndex) select 1;
_baseprice = _baseprice / 10;
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) isEqualTo "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
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

_box = boundingBox _vehicle;  
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...
_sp = visiblePosition _vehicle;
_sp = _sp vectorAdd [0,0,_offset]; 
_vh = createVehicle ["Sign_Arrow_Large_F", _sp ,[],0,"NONE"];
_vh setPos _sp; 

hint "Twoje auto ktore chcesz zobaczyc jest oznaczone czerwona strzalka.";
closeDialog 0; //Exit the menu.

uiSleep 6;

hint "Podglad pojazdu zakonczony!";
deleteVehicle _vehicle;
deleteVehicle _vh;
previewing_on = false;
true;


