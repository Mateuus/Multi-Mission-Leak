/*
*
* buyHouse [house_name]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy", "_house_spawns"];

_exdata = missionNamespace getVariable "house_current_exdata";
_house_spawns = (missionNamespace getVariable "spawn_home_list") select 0;

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal;
_price = [_exdata, "price"] call EMonkeys_fnc_houseExtractDataVal;

//Check license
if (!license_civ_home) exitWith
{
	hint "Du kannst noch kein Haus kaufen. Besorge dir eine Eigentumsurkunde!";
};

if (count _house_spawns >= 3) exitWith
{
	hint "Du kannst nicht noch mehr Häuser kaufen";
};

//Check money
_canbuy = true;
if ((EMonkeys_c164 - _price) < 0) then //Not enough money
{
	_canbuy = false;
	if ((EMonkeys_a164 - _price) >= 0) then //not enough money in atmcash
	{
		hint "Du hast nicht genug Geld!";
		_canbuy = true;
	};
};

if(_canbuy) then
{
	hint "Frage Datenbank an ... Haus kaufen";

	//call command
	[ [_name, player, _price] , "HOUSE_fnc_DBbuyHouse" ,false, false] call EMonkeys_fnc_MP;

	//Remove money
	if (EMonkeys_c164 - _price < 0) then
	{
		EMonkeys_a164 = EMonkeys_a164 - _price;
	}
	else
	{
		EMonkeys_c164 = EMonkeys_c164 - _price;
	};

	[6] call SOCK_fnc_updatePartial;
	
	_marker = [_exdata, "marker_spawn"] call EMonkeys_fnc_houseExtractDataVal;
	_home_spawn_data = (missionNamespace getVariable "spawn_home_list") select 0;
	
	_home_spawn_data pushBack [_marker];
	missionNamespace setVariable ["spawn_home_list",[_home_spawn_data],false];
}
else
{
	hint "Du hast nicht genug Geld!";
};