/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_specialText.sqf
	Server: e-Monkeys.com
    
    Description: Spawn a special Massage
*/
private["_fuelstationData","_ownername","_fuelstationName"];
_fuelstationData = (_this select 0) select 0;
_ownername = (_this select 1) select 0;

_fuelstationName = "";
if(isNil{_fuelstationData select 1}) then{_fuelstationName = _fuelstationData select 2;} else {_fuelstationName = _fuelstationData select 1;};

if ((_fuelstationData select 0) != "system") then 
{
	[parseText format
		["	<t align='right'><t color = '#81c800' font='PuristaBold' size='2'>%1<br/></t>
			<t font='PuristaMedium' color = '#81c800' size='1.6'>Besitzer: %2 <br/> Gepachtet ab: %3 <br/> Gepachtet bis: %4 <br/></t></t>",
			_fuelstationName,_ownername select 0,_fuelstationData select 3, _fuelstationData select 4
		],
		[0.6,0.4,1,1],
		nil,
		10,
		0.7,
		0
	] spawn BIS_fnc_textTiles;
} else {
	[parseText format
		["	<t align='right'><t color = '#81c800' font='PuristaBold' size='2'>%1<br/></t>
			<t font='PuristaMedium' color = '#81c800' size='1.6'>Besitzer: %2</t></t>",
			_fuelstationData select 2,"Staat Altis"
		],
		[0.6,0.4,1,1],
		nil,
		10,
		0.7,
		0
	] spawn BIS_fnc_textTiles;
};