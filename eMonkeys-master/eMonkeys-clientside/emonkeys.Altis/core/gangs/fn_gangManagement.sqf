/*
	File: fn_gangManagement.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for the gang 'management' menu.
*/
private["_uisleep","_group","_gang","_owner","_ownerID","_units","_dialog","_members"];
disableSerialization;

_uisleep = [_this,0,false,[false]] call BIS_fnc_param;
if(_uisleep) then { uisleep 1;};

_group = eM_my_gang;
if(isNull _group) exitWith {closeDialog 0;};
_gang = [_group,EMonkeys_gang_list] call TON_fnc_index;
_gang = EMonkeys_gang_list select _gang;
_owner = call compile format["%1",_gang select 3];
_ownerID = _gang select 4;
_units = units (group player);
waitUntil {!isNull (findDisplay 2620)};
_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;

lbClear _members;




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



switch (true) do
{
	case (player == leader(group player)) :
	{
		if((_gang select 2)) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	case ((getPlayerUID player) == _ownerID) :
	{
		if((_gang select 2)) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	default
	{
		ctrlShow[2622,false];
		ctrlShow[2623,false];
		ctrlShow[2624,false];
		ctrlShow[2625,false];
	};
};

ctrlSetText[601,(_gang select 0)];

for "_i" from 0 to (count _units)-1 do
{
	switch (true) do
	{
		case ((_units select _i) == leader(group player)) :
		{
			_members lbAdd format["%1 [Leader]",name (_units select _i)];
		};
		
		case ((getPlayerUID (_units select _i)) == _ownerID) :
		{
			_members lbAdd format["%1 [Founder]", name (_units select _i)];
		};
		
		default 
		{
			_members lbAdd format["%1",name (_units select _i)];
		};
	};
	
	_members lbSetData [(lbSize _members)-1,str(_units select _i)];
};