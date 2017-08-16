/*
	@file Version: 1.Bf
	@file name: buy.sqf
	@file Author: TAW_Tonic
	@file edit: 5/19/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;
if (life_veh_shop in ["civ_car","civ_servt","bh_car"]) then{_ret = license_civ_driver;};
if (life_veh_shop in ["civ_ship"]) then{_ret = license_civ_boat;};
if (life_veh_shop in ["civ_kart","med_car","med_air"]) then{_ret = true;};
if (life_veh_shop in ["civ_air"]) then{_ret = license_civ_air;};
if (life_veh_shop in ["cop_air"]) then{_ret = license_cop_air;};
if (life_veh_shop in ["civ_truck"]) then{_ret = license_civ_truck;};
if (life_veh_shop in ["reb_car"]) then{_ret = license_civ_rebel;};
if (life_veh_shop in ["cop_car"]) then{_ret = true;};
if (life_veh_shop in ["cop_ship"]) then
{
	hint format["%1", _veh];
	if(_veh == "B_Boat_Armed_01_minigun_F") then
	{
		_ret = license_cop_cg;
	}
	else
	{
		_ret = true;
	};
};
_ret;