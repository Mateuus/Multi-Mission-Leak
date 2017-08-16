/*
	File: fn_painballHitConfirmed.sqf
	Author: MarkusSR1984
	
	Description:
	Trefferrückmeldung
*/


_Name = param [0,"ERROR",[""]];
_Side = param [1,"",[""]];

if (_Side == player getVariable["pballSide",""]) then
{
	hint "SUPER GEMACHT\nDU HAST EIN TEAMMITGLIED AUSGESCHALTET";
}
else
{
	hint format ["Du hast\n%1\nausgeschaltet",_Name];
	DWEV_paintball_kills = DWEV_paintball_kills + 1;
};

