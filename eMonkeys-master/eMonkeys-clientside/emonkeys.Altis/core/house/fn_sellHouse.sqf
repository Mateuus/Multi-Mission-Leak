/*
*
* buyHouse [house_name]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy"];

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal;
_price = [_exdata, "price_sell"] call EMonkeys_fnc_houseExtractDataVal; //USE PRICE_SELL



if(([_exdata, "owner"] call EMonkeys_fnc_houseExtractDataVal) == getPlayerUID player) then
{
	hint "Frage Datenbank an ... Haus verkaufen";

	//call command
	[ [_name, player, _price] , "HOUSE_fnc_DBsellHouse" ,false, false] call EMonkeys_fnc_MP;

	//Remove money
	EMonkeys_a164 = EMonkeys_a164 + _price;

	[6] call SOCK_fnc_updatePartial;
	
	_marker = [_exdata, "marker_spawn"] call EMonkeys_fnc_houseExtractDataVal;
	_home_spawn_data = (missionNamespace getVariable "spawn_home_list") select 0;
	
	_home_spawn_data = _home_spawn_data - [[_marker]];
	missionNamespace setVariable ["spawn_home_list",[_home_spawn_data],false];
}
else
{
	hint "Dir gehört das Haus nicht!";
};