/*
	File: fn_getRecipe.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens the factory UI and populates recipes
*/

private ["_class","_display","_items","_name","_color","_canCraft","_title","_icon"];

if (isNull (findDisplay 1800)) exitWith {};
disableSerialization;

ctrlEnable [1830, false];
_display = findDisplay 1800;
_recipeItems = _display displayCtrl 1860;
_title = _display displayCtrl 1865;
_description = _display displayCtrl 1855;
_class = lbData[1850,lbCurSel (1850)];
_name = "Item";
_items = _class call life_fnc_recipeDetail;

_desc = "No description available.";
if (isClass (configFile >> "CfgVehicles" >> _class)) then {
	_vehicleInfo = [_class] call life_fnc_fetchVehInfo;
	_icon = _vehicleInfo select 2;
	_name = _vehicleInfo select 3;
	_trunkSpace = "Unknown";
	_price = 0;
	{
		if ((_x select 8) == civilian && (_x select 1) == _class) exitWith { _price = _x select 2; _trunkSpace = _x select 3; };
	} forEach life_vehicleInfo;
	_desc = format["<t size='1'>Base Price: <t color='#8cff9b'>$%7</t><br/>Max Speed: %1 km/h<br/>Horse Power: %2<br/>Passenger Seats: %3<br/>Trunk Capacity: %4<br/>Fuel Capacity: %5<br/>Armor Rating: %6",
		_vehicleInfo select 8,
		_vehicleInfo select 11,
		_vehicleInfo select 10,
		_trunkSpace,
		_vehicleInfo select 12,
		_vehicleInfo select 9,
		[_price] call life_fnc_numberText
	];
	life_veh_shop = "black_market";
	[1850,1804] call life_fnc_vehicleColorList;
}
else
{
	if (isClass (configFile >> "cfgMagazines" >> _class)) exitWith {
		_name = getText(configFile >> "cfgMagazines" >> _class >> "displayName");
		_desc = "Ammunition for a weapon";
	};
	_index = [_class,life_weapon_shop_array] call life_fnc_index;
	_name = getText(configFile >> "cfgWeapons" >> _class >> "displayName");
	_desc = format["<t size='1'>Base Price: <t color='#8cff9b'>$%1</t><br/>Type: %2<br/><br/>Max Range: %3 m",
		[(life_weapon_shop_array select _index) select 1] call life_fnc_numberText,
		getText (configFile >> "cfgWeapons" >> _class >> "descriptionShort"),
		getNumber (configFile >> "cfgWeapons" >> _class >> "maxRange")
	];
};

_title ctrlSetStructuredText parseText format["<t size='1.75'>%1</t>", _name];
_description ctrlSetStructuredText parseText _desc;

_canCraft = true;
lbClear _recipeItems;
{
	_req = _x select 1;
	if ((life_turf_list select 2) select 1 == life_gang) then { _req = ceil (_req * 0.75); };
	
	if ((call compile (_x select 0)) >= _req) then { _color = [0, 1, 0, 1]; }
	else { _color = [1, 0, 0, 1]; _canCraft = false };
	
	_recipeItems lbAdd format ["%1x %2", _req, [_x select 0] call life_fnc_vartoStr];
	_recipeItems lbSetColor [(lbSize _recipeItems)-1, _color];
} forEach _items;

if (count _items < 1) then {
	_canCraft = false;
	_recipeItems lbAdd "You do not know how to produce this item.";
};

ctrlEnable [1830, _canCraft];
if (isClass (configFile >> "cfgMagazines" >> _class)) exitWith {ctrlEnable [1832, false];};
ctrlEnable [1832, _canCraft];