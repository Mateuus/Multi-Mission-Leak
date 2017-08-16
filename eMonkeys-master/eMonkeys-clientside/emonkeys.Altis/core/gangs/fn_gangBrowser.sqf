/*
	File: fn_gangBrowser.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fills out the gang 'browser' menu with gangs.
*/
private["_gangs","_dialog","_gang","_locked"];
disableSerialization;

waitUntil {!isNull (findDisplay 2520)};
_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;



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
	_gang = _x;
	if(!isNull (_gang select 1)) then
	{
		if((_gang select 2)) then
		{
			_locked = "Geschlossen";
		}
			else
		{
			_locked = "Offen";
		};
		
		_gangs lbAdd format["%1 [Mitglieder: %2] - %3",_gang select 0,count (units(_gang select 1)),_locked];
		_gangs lbSetData [(lbSize _gangs)-1,_gang select 0];
	};
} foreach (EMonkeys_gang_list);

if(((lbSize _gangs)-1) == -1) then
{
	_gangs lbAdd "Keine Gangs vorhanden!";
	ctrlShow[2522,false];
};