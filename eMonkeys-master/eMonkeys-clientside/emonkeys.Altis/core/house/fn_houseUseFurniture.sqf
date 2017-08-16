/*

	Uses a furniture item and tries to add it to a house

*/

private["_shortname","_setarr","_weighttoadd", "_cond"];

_shortname = _this select 0;
_weighttoadd = 10;

if( !(_shortname in ["furniture_01", "furniture_02", "furniture_03", "furniture_04", "furniture_05"]) ) exitWith {};
if(eM_action_inUse) exitWith {};

hint "Bitte warten ...";

eM_action_inUse = true;


switch (true) do 
{
	case (_shortname == "furniture_01"): { _weighttoadd = 80; };
	case (_shortname == "furniture_02"): { _weighttoadd = 100; };
	case (_shortname == "furniture_03"): { _weighttoadd = 120; };
	case (_shortname == "furniture_04"): { _weighttoadd = 140; };
	case (_shortname == "furniture_05"): { _weighttoadd = 160; };
};

if([false, _shortname, 1] call EMonkeys_fnc_handleInv) then
{
	[] call EMonkeys_fnc_p_updateMenu;

	//call command
	[ [player, _shortname, _weighttoadd] , "HOUSE_fnc_DBuseFurniture" ,false, false] call EMonkeys_fnc_MP;
	

	[6] call SOCK_fnc_updatePartial; 
}
else
{
	hint "Konnte Item nicht aus Inventar nehmen!";
	eM_action_inUse = false;
};
