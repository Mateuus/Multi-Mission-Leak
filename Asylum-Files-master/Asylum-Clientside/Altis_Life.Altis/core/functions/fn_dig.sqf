/*
	File: fn_dig.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Dig up a treasure map site!
*/

_map = -1;
_maps = [];
_position = [0,0,0];
for "_i" from 1 to 5 do
{
	if ((call compile format["life_inv_treasure_%1", _i]) > 0) then { _maps pushBack _i };
};

if (count _maps == 0) exitwith { hint "You need to have a treasure map with you before you can dig!" };

// Animation

{
	if (player distance ([_x] call life_fnc_treasurePos) <= 8) exitWith { _map = _x; _position = [_x] call life_fnc_treasurePos; };
} forEach _maps;

[[player,"AwopPknlMstpSgthWpstDnon_Part5","playNow",0.45],"life_fnc_animSync",true,false] spawn life_fnc_MP;
[[player, "pickaxe",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
sleep 3;
[[player,"","stop",0],"life_fnc_animSync",true,false] spawn life_fnc_MP;

if (_map < 0) exitWith { hintSilent "You dig but find nothing within 8 meters of this area." };

// Found treasure with map ID _map

if (!([false,format["treasure_%1", _map],1] call life_fnc_handleInv)) exitWith {};

// 50k to 100k
_maxValue = random 50000;
_maxValue = _maxValue + 50000;
_totalValue = 0;

_validItems = ["rum_3","scotch_3","cocainepure","diamondf","ruby","pearl"];
_items = [];

_index = -1;
{ if ("treasure" == (_x select 0)) then { _index = _forEachIndex;} } forEach buy_array;
_treasurePrice = (buy_array select _index) select 1;
_items pushBack ["treasure",floor (_maxValue / _treasurePrice)];
_totalValue = (floor (_maxValue / _treasurePrice)) * _treasurePrice;

while {true} do
{
	_item = _validItems call BIS_fnc_selectRandom;
	_index = -1;
	{ if (_item == (_x select 0)) then { _index = _forEachIndex;} } forEach buy_array;
	_price = (buy_array select _index) select 1;
	_ind = -1;
	{ if (_item == (_x select 0)) then { _ind = _forEachIndex;} } forEach _items;
	if (_ind < 0) then { _items pushBack [_item,1]; }
	else { _v = (_items select _ind) select 1; _items set[_ind, [_item,_v+1]]; };
	_totalValue = _totalValue + _price;
	if (_totalValue> _maxValue) exitWith {};
};

_container = "Box_East_Support_F" createVehicle (getPos player);
_container setDamage 0;
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearBackpackCargoGlobal _container;
clearItemCargoGlobal _container;
_container setVariable ["Trunk", [_items,0], true];
_container setVariable ["Treasure", true, true];

[[2002, player, format["Dug up treasure with map %2 worth $%1!",_totalValue, _map]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

[[0,1,2], "You found a treasure chest buried in the dirt!"] call life_fnc_broadcast;