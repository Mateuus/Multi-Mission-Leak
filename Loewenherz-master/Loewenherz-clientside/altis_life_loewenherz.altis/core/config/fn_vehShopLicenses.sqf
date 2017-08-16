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

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (lhm_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "med_container": {_ret = true;};
	case "cop_container": {_ret = true;};
	case "civ_container": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = true;};
	// LHM
	case "sec_shop": {_ret = true;};
	case "donator_car": {_ret = true;};
	case "donator_air": {_ret = true;};
	case "civ_serv_truck": {_ret = license_civ_driver;};
	case "civ_hunter_car": {_ret = license_civ_driver;};
	case "gang_area_car": {_ret = true;};
	case "gang_area_air": {_ret = true;};
	case "sec_heli_shop": {_ret = true;};
	case "sec_car_shop": {_ret = true;};
	case "don-store": {_ret = true;};
	// LHM
	case "cop_ship":
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