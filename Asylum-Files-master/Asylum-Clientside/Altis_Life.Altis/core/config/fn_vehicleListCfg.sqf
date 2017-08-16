/*
	File: fn_vehicleListCfg.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];

_info = switch (worldName) do
{
	case "Stratis": { life_vehicleInfoStratis };
	default { life_vehicleInfo };
};

{
	if (_x select 0 == _shop) then
	{
		if ((life_donator >= _x select 4) && (life_coplevel >= _x select 5) && (life_swatlevel >= _x select 6) && ((_x select 7) == 0 || (_x select 7) in life_talents) && ((_x select 9) == 0 || (((_x select 9) in life_coptalents) && (life_coprole in ["all","detective"]))) && ((_x select 10) == 0 || (_x select 10) in life_achievements)) then
		{
			_return set[count _return,[_x select 1, _x select 2, _x select 3, _x select 9]];
		};
	};
} foreach _info;
_return;