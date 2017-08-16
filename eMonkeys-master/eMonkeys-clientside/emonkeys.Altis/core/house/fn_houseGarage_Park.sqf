/*
*
* houseGarage_Park [player]
*/

private["_name", "_exdata", "_setarr", "_price", "_canbuy"];

_exdata = missionNamespace getVariable "house_current_exdata";

if(isNil "_exdata") exitWith
{
	hint "Error: exdata is NULL. Cancelling.";
};

_name = [_exdata, "name"] call EMonkeys_fnc_houseExtractDataVal;

//Call vehicle store
[player,player] call EMonkeys_fnc_storeVehicle;

