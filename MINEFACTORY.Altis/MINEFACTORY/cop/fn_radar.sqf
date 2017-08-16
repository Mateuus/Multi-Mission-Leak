#include "..\..\script_macros.hpp"
/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	Edit by Minefactory.eu
	Description:
	Looks like weird but radar?
*/
private ["_speed","_vehicle", "_filters","_Nummer"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;
_filters = ["Car","Air","Ship"];
_Nummer = _vehicle GVAR "vehicle_info_owners";
if(!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};

if((currentWeapon player) == "hgun_P07_snds_F") then
{
	switch (true) do 
	{
		case ((_speed <= 33)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +( "Halterabfrage")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +( "Halterabfrage2"),round _Nummer];
		};
		
		case ((_speed > 33 && _speed <= 80)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +( "Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +( "Geschwindigkeit %1 km/h"),round  _speed ];
		};
		
		case ((_speed > 80)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +( "Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" +( "Geschwindigkeit %1 km/h"),round  _speed ];
		};
	};
};

	if((currentWeapon player) == "Binocular") then {
	
	hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +( "Halterabfrage")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +( "Halterabfrage2"),round _Nummer];
	};

	if((currentWeapon player) == "Rangefinder") then {
	
	hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +( "Halterabfrage")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +( "Halterabfrage2"),round _Nummer];
	};
