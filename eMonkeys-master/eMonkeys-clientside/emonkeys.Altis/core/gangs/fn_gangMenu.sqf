/*
	File: fn_gangMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether it needs to open the gang management menu or the choice menu.
*/
closeDialog 0;

if(!isNull eM_my_gang) then
{
	createDialog "EMonkeys_My_Gang_Diag";
	disableSerialization;
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
}
	else
{
	createDialog "EMonkeys_Gang_Prompt";
	disableSerialization;
		disableSerialization;
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
};


