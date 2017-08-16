/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true};

switch (life_veh_shop select 0) do
{
	case "civ_car_1": {_ret = license_civ_driver;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_shop": {_ret = license_med_air;};
	case "med_air_1": {_ret = license_med_air;};
	case "civ_ship_1": {_ret = license_civ_boat;};
	case "civ_air_1": {_ret = license_civ_air;};
	case "cop_air_1": {_ret = license_cop_air;};
	case "civ_truck_1":	{_ret = license_civ_truck;};
	case "civ_servt_1": {_ret = license_civ_driver;};
	case "reb_v_1": {_ret = license_civ_rebel;};
	case "adac_car": {_ret = license_adac_car;};
    case "adac_air": {_ret = license_adac_air;};
	case "cop_car_1": {_ret = true;};
	case "fed_car": {_ret = true;};
	case "fed_air": {_ret = true;};
	case "ateam" : {_ret = license_civ_driver;};
	case "qt" : {_ret = license_civ_driver;};
	case "donator_car": {_ret = license_civ_driver;}; // lvl 1
	case "donator_car_1": {_ret = license_civ_air;}; // lvl 2
	case "soldner_1": {_ret = license_civ_air;}; // lvl 3
	case "cop_ship_1": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;