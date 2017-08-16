private["_veh","_ret"];
_veh = _this select 0;
_ret = false;
if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.
switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = liciv_driver;};
	case "civ_car": {_ret = liciv_driver;};
	case "civ_ship": {_ret = liciv_boat;};
	case "civ_air": {_ret = liciv_air;};
	case "cop_air": {_ret = licop_cair;};
	case "civ_truck":	{_ret = liciv_truck;};
	case "reb_car": {_ret = liciv_rebel;};
	case "cop_car": {_ret = licop_cdriver;};	
	case "cop_ship": {_ret = licop_cg;};		
};
_ret;