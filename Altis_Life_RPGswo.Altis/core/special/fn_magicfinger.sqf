#include "..\..\macros.hpp"
/*
	File: fn_magicfinger.sqf
	Author: Division Wolf (Sandmann / MarkusSR1984)
	
	Description:
	Magicfinger for fair play
*/
private ["_vehicle"];
_vehicle = cursorTarget;
_crewText = "";


if (isNil "_vehicle") exitWith {};
if (isNull _vehicle) exitWith {};
if !((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) exitWith {};

if (((_vehicle isKindOf "Car") || (_vehicle isKindOf "Ship")) && (player distance _vehicle < 250) ) exitWith 
{

	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

	if ((count crew _vehicle) <= 0) then 
	{
		_crewText = "KEINE INSASSEN";
	}
	else
	{
		{
			_name = getPlayerDName(_x);
			if (_x getVariable["noobschutz",false]) then // Noobschutz
					{
						_name = format["<t color='#FF0000'>%1</t>", _name];
												
					};
			if (_x == (driver _vehicle)) then 
			{
				_crewText = format ["%1Fahrer: %2<br/>",_crewText, _name]
			}
			else
			{
				_crewText = format ["%1Beifahrer: %2<br/>",_crewText, _name]
			};
	
	
		} count crew _vehicle;
	};


	hint parseText format ["
	<t color='#ffffff'><t size='2'><t align='center'>Information<br/>
	<t color='#33CC33'><t size='1'><t align='center'>Fahrzeug: %2<br/>
	<t color='#33CC33'><t align='center'><t size='1'>%1",_crewText,_type];

};

if ((_vehicle isKindOf "Air") && (player distance _vehicle < 750) ) exitWith 
{

	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

	if ((count crew _vehicle) <= 0) then 
	{
		_crewText = "KEINE INSASSEN";
	}
	else
	{
		{
			if (_x == (driver _vehicle)) then 
			{
				_crewText = format ["%1Pilot: %2<br/>",_crewText, getPlayerDName(_x)]
			}
			else
			{
				_crewText = format ["%1Beifahrer: %2<br/>",_crewText, getPlayerDName(_x)]
			};
	
	
		} count crew _vehicle;
	};


	hint parseText format ["
	<t color='#ffffff'><t size='2'><t align='center'>Information<br/>
	<t color='#33CC33'><t size='1'><t align='center'>Fahrzeug: %2<br/>
	<t color='#33CC33'><t align='center'><t size='1'>%1",_crewText,_type];

};