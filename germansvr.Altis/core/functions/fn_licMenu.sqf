#include "..\..\script_macros.hpp"
private["_lic","_side","_struct"];
disableSerialization;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"civ"};};

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
<t color='#FFB124'>PKW-Fuehrerschein:</t> 500 €<br/>
<t color='#FFB124'>LKW-Fuehrerschein:</t> 75.000 €<br/>
<t color='#FFB124'>Pilotenschein:</t> 250.000 €<br/>
<t color='#FFB124'>Bootsschein:</t> 1.000 €<br/>
<t color='#FFB124'>Taucherschein:</t> 2.000 €<br/>
<t color='#FFB124'>Waffenschein:</t> 100.000 €<br/>
<t color='#FFB124'>Eigentumsurkunde:</t> 1.000.000 €<br/>
<t color='#FFB124'>Rebellen Lizens:</t> 2.500.000 €<br/>
<t color='#FFB124'>Neureichten Lizens:</t> 15.000.000 €<br/>
<t color='#FFB124'>Schwarzmarkt Lizens:</t> 25.000.000 €<br/><br/>");