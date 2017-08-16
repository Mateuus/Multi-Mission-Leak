/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starting to lose track on shit I wrote a year ago..
*/
private["_vehicle","_weight","_used","_vehType"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_vehType = (typeOf _vehicle);
_weight = [_vehType] call life_fnc_vehicleWeightCfg;

// Cars
if (_vehType in ["C_Offroad_01_F","B_G_Offroad_01_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","B_MRAP_01_F","O_MRAP_02_F","I_MRAP_03_F"]) then
{
	switch true do
	{
		case ("Starter III" in life_talent_talents) : { _weight = (_weight + 50); };
		case ("Starter II" in life_talent_talents) : { _weight = (_weight + 25); };
		case ("Starter I" in life_talent_talents) : { _weight = (_weight + 10); };
		default { _weight = _weight; };
	};
};

// Trucks
if (_vehType in ["I_Truck_02_covered_F","I_Truck_02_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F","C_Van_01_box_F","B_Truck_01_box_F","B_Truck_01_transport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","I_Truck_02_medical_F","O_Truck_03_medical_F","B_Truck_01_medical_F"]) then
{
	switch true do
	{
		case ("Trucker III" in life_talent_talents) : { _weight = (_weight + 250); };
		case ("Trucker II" in life_talent_talents) : { _weight = (_weight + 100); };
		case ("Trucker I" in life_talent_talents) : { _weight = (_weight + 50); };
		default { _weight = _weight; };
	};
};

// Boats
if (_vehType in ["C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Rubberboat","O_Boat_Armed_01_hmg_F","B_Boat_Armed_01_minigun_F","I_Boat_Armed_01_minigun_F","B_G_Boat_Transport_01_F","B_Boat_Transport_01_F","B_SDV_01_F"]) then
{
	switch true do
	{
		case ("Sailor III" in life_talent_talents) : { _weight = (_weight + 250); };
		case ("Sailor II" in life_talent_talents) : { _weight = (_weight + 100); };
		case ("Sailor I" in life_talent_talents) : { _weight = (_weight + 50); };
		default { _weight = _weight; };
	};
};

//Air B_Heli_Light_01_F I_Heli_light_03_unarmed_F
if (_vehType in ["O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F"]) then
{
	switch true do
	{
		case ("Professional III" in life_talent_talents) : { _weight = (_weight + 250); };
		case ("Professional II" in life_talent_talents) : { _weight = (_weight + 100); };
		case ("Professional I" in life_talent_talents) : { _weight = (_weight + 50); };
		default { _weight = _weight; };
	};
};


if(isNil "_used") then {_used = 0};
[_weight,_used];