#include "..\..\script_macros.hpp"
/*
	File: fn_licMenu.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private["_lic","_side","_struct"];
disableSerialization;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

_lic = CONTROL(7123,2014);
_price = CONTROL(7123,2015);
_struct = "";

{
	_displayName = getText(_x >> "displayName");
	
	if(LICENSE_VALUE(configName _x,_side)) then {
		_struct = _struct + format["%1<br/>",localize _displayName];
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if(EQUAL(_struct,"")) then {
	_struct = "No Licenses";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];

_price ctrlSetStructuredText parseText ("<t size='0.8'>
Allgemeine Lizenzen<br/>
<t color='#FFB124'>PKW-Fuehrerschein:</t> 750$<br/>
<t color='#FFB124'>LKW-Fuehrerschein:</t> 25.000$<br/>
<t color='#FFB124'>Heli Pilotenschein:</t> 75.000$<br/>
<t color='#FFB124'>Flugzeug Pilotenschein:</t> 100.000$<br/>
<t color='#FFB124'>Bootsschein:</t> 2.000$<br/>
<t color='#FFB124'>Taucherschein:</t> 2.000$<br/>
<t color='#FFB124'>Waffenschein:</t> 45.000$<br/>
<t color='#FFB124'>Eigentumsurkunde:</t> 1.000.000$<br/>
<t color='#FFB124'>Rebellen Lizens:</t> 1.000.000$<br/><br/>

Legale Farmlizensen<br/>
<t color='#FFB124'>Kokosfleisch:</t> 8.000$<br/>
<t color='#FFB124'>Kokosmilch:</t> 8.000$<br/>
<t color='#FFB124'>Zucker:</t> 12.500$<br/>
<t color='#FFB124'>Kaffee:</t> 12.500$<br/>
<t color='#FFB124'>Kupfer:</t> 25.000$<br/>
<t color='#FFB124'>Tabak:</t> 35.000$<br/>
<t color='#FFB124'>Cocktail:</t> 50.000$<br/>
<t color='#FFB124'>Stahl:</t> 75.000$<br/>
<t color='#FFB124'>Krabben:</t> 70.000$<br/>
<t color='#FFB124'>Jagdschein:</t> 150.000$<br/><br/>

Illegale Farmlizensen<br/>
<t color='#FFB124'>Hanf:</t> 45.000$<br/>
<t color='#FFB124'>Meth:</t> 65.000$<br/>
<t color='#FFB124'>Palmol:</t> 75.000$<br/>
<t color='#FFB124'>Kristalle:</t> 80.000$<br/>
<t color='#FFB124'>Korallen:</t> 60.000$<br/>
<t color='#FFB124'>angereichertes Uran:</t> 100.000$");