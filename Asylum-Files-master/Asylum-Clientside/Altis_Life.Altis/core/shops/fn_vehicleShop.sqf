/*
	File: fn_vehicleShop.sqf
	Author: Skalicon
	
	Description:
	Handles everything that happens when you open the vehicle shop.
*/

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if ((player distance _unit) > 10) exitWith { hint "You are too far away." };

life_veh_shop = _this select 3;
if (typeName life_veh_shop == "ARRAY") then
{
	[(_this select 3) select 1] call life_fnc_getSpawnMarker;
}
else
{
	[] call life_fnc_getSpawnMarker;
};
disableSerialization;
_kill = "";
if(!dialog) then
{
	createDialog "Life_vehicle_shop";
	if (typeName life_veh_shop == "ARRAY") then	{ life_veh_shop = (_this select 3) select 0; }
	else { life_veh_shop = _this select 3; };
};

_display = findDisplay 2300;
_vehicles = _display displayCtrl 2302;
lbClear _vehicles;
ctrlShow[2303,false];
ctrlShow[2355,false];
ctrlEnable [2309, false];
_type = "Car";

switch (life_veh_shop) do
{
	case "civ_car":
	{
		if(playerSide in [west,independent]) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
		
	case "civ_servt":
	{
		if(playerSide in [west,independent]) exitWith {_kill = "You are not a civilian."};
		ctrlSetText[2301,"Service Truck Shop"];
	};

	case "reb_car":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};

	case "bh_car":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Bounty Hunter Car Shop"];
	};
	
	case "civ_kart":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Go-Kart Shop"];
		_type = "Kart";
	};
	
	case "med_car":
	{
		if(playerSide in [west,civilian]) exitWith {_kill =  "You are not a paramedic."};
		ctrlSetText[2301,"Ambulance Shop"];
	};
	
	case "med_air":
	{
		if(playerSide in [west,civilian]) exitWith {_kill =  "You are not a paramedic."};
		ctrlSetText[2301,"Medivac Shop"];
		_type = "Air";
	};
	
	case "reb_air":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Air Shop"];
		_type = "Air";
	};
	
	case "reb_ship":
		{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Rebel Boat Shop"];
		_type = "Ship";
	};
	
	case "cop_car":
	{
		if(playerSide != west) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "civ_air":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Civilian Air Shop"];
		_type = "Air";
	};
	
	case "cop_air":
	{
		if(playerSide != west) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Air Shop"];
		_type = "Air";
	};
	
	case "civ_ship":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Boat Shop"];
		_type = "Ship";
	};
	
	case "civ_truck":
	{
		if(playerSide in [west,independent]) exitWith {_kill =  "You are not a civilian."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "cop_ship":
	{	
		if(playerSide != west) exitWith {_kill =  "You are not a cop."};
		ctrlSetText[2301,"Cop Boat Shop"];
		_type = "Ship";
	};
};

if(_kill != "") exitWith {
	hint _kill;
	closeDialog 0;
};

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

life_veh_count = nil;
[[getPlayerUID player,playerSide,_type,player,true],"ASY_fnc_getVehicles",false,false] spawn life_fnc_MP;
waitUntil { !isNil "life_veh_count" };
_garageCap = 30;
if (life_veh_count >= _garageCap) exitWith { closeDialog 0; hint format["You cannot buy more vehicles at this garage until you sell (or crash) existing vehicles! The current maximum is %1 vehicles per garage.", _garageCap] };

ctrlEnable [2309, true];

{
	_className = _x select 0;
	_basePrice = _x select 1;
	
	_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,str [_className,(_x select 3 > 0)]];
	_control lbSetValue [(lbSize _control)-1,_forEachIndex];
} foreach ([life_veh_shop] call life_fnc_vehicleListCfg);
