/*
	fn_customTruckShopBuy.sqf
	Pennyworth
*/

params ["_className","_mode","_preview"];
diag_log format ["7 buy preview: %1",_preview];
if(_preview) then {
	if(previewing_on) exitwith { ["Juz cos ogladasz!", false] spawn doquickmsg; };			
	previewing_on = true;
};

_list = [life_veh_shop select 0] call life_fnc_vehicleListCfg; 
_price = -1;

{
	if((_x select 0) find _className != -1) exitWith {
		_price = _x select 1;
	};
} count _list;
_price = _price / 10;

//Series of checks (YAY!)
if(_price isEqualTo -1) exitWith {};
if(cash_in_hand < _price && !_preview) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_price - cash_in_hand] call life_fnc_numberText], false] spawn domsg;};

if(side player != west && !_preview) then {
	if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {[localize "STR_Shop_Veh_NoLicense", false] spawn domsg;};
};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";


//Check if there is multiple spawn points and find a suitable spawnpoint.
if(typeName _spawnPoints isEqualTo typeName []) then {
	//Find an available spawn point.
	{if(count(nearestObjects[(getMarkerPos _x),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};


if(_spawnPoint isEqualTo "") exitWith {[localize "STR_Shop_Veh_Block", false] spawn domsg;};
if(!_preview) then {
	["cash","take",_price] call life_fnc_handleCash; 
	[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_price] call life_fnc_numberText], false] spawn domsg;
	[player,"buycarniggah"] spawn life_fnc_nearestSound;
};
_obj = ObjNull;
_red = life_lastShownVehicleColors select 0;
_green = life_lastShownVehicleColors select 1;
_blue = life_lastShownVehicleColors select 2;
//Spawn the vehicle and prep it.

_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle setVariable ["Red",_red,true];
_vehicle setVariable ["Green",_green,true];
_vehicle setVariable ["Blue",_blue,true];
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

if(_preview) then {
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

	hint "Podglad pojazdu zakonczony";
	deleteVehicle _vehicle;
	deleteVehicle _vh;
	previewing_on = false;
} else {
	_vehicle allowDamage true;

	life_vehicles pushBack _vehicle; //Add err to the chain.
	if(_mode) then {
		[(getPlayerUID player),playerSide,_vehicle,[_red,_green,_blue]] remoteExecCall ["TON_fnc_vehicleCreate",(call life_fnc_HCC)];
	};
	closeDialog 0; //Exit the menu.
};
