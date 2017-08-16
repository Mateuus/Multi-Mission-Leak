/*

		fn_gericht.sqf
		Author: G00golplexian
		
		Description: Teleports you to the gerichtssaal.
*/

private["_unit","_richtung"];
_unit = _this select 1;
_richtung = _this select 3;

switch(_richtung) do {

case 0: {_unit setpos (gericht buildingPos 0)};
case 1: {_unit setpos (getmarkerPos "gericht_kavala")};
};