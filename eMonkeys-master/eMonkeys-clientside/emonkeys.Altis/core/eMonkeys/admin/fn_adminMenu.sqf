/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if((call EMonkeys_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if((call EMonkeys_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _list;
if((call EMonkeys_adminlevel) < 3) then
{
	ctrlShow[2030,false];
	ctrlShow[2070,false];
	ctrlShow[2060,false];
	ctrlShow[2023,false];
	ctrlShow[1339,false];
	ctrlShow[2066,false];
	ctrlShow[2061,false];
	ctrlShow[2062,false];
	ctrlShow[2063,false];
	ctrlShow[2064,false];
};

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2054,false]; //Craft Icon
		ctrlShow[2055,false]; //Craft Button
	};
	case independent:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case civilian:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case east:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
};

if((call EMonkeys_coplevel) < 3) then
{
	ctrlShow[2406,false]; //Wanted + Button
	ctrlShow[2407,false]; //Wanted + Icon
};

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};


if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};




{
	_side = switch(side _x) do {case west: {"Cop"};case independent: {"Medic"}; case civilian : {"Civ"}; case east : {"Civ"}; default {"Civ"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if((call EMonkeys_adminlevel) < 1) exitWith {closeDialog 0;};