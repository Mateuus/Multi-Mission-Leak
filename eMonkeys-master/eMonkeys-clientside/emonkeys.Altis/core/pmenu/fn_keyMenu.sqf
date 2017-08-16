/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index","_side"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

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
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
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





{ if(player distance _x < 15) then {_near_units pushBack _x};} foreach playableUnits;

for "_i" from 0 to (count EMonkeys_vehic164)-1 do
{
	_veh = EMonkeys_vehic164 select _i;
	if(!isNull _veh && alive _veh) then
	{
		_color = getText(missionConfigFile >> "CfgVehicleColor" >> typeOf _veh >> (_veh getVariable "EMonkeys_VEH_color") >> "name");
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		
		_vehicles lbAdd format["%1 %3",_name,round(player distance _veh),_text];

		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		if(typeOf _veh != "Box_IND_AmmoVeh_F") then
		{
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
	};
};

{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_side = "Cop"};
			case independent: {_side = "Med"};
			case civilian: {_side = "Civ"};
			case east: {_side = "Civ"};
		};
	
		_plist lbAdd format["%1 - %2",_x getVariable["realname",name _x], _side];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "Sie besitzen gerade keine Schlüssel!";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};