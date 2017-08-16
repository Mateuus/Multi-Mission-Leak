/*

		fn_gericht.sqf
		Author: G00golplexian
		
		Description: Teleports you to the mine.
*/

private["_unit","_richtung"];
_unit = _this select 1;
_richtung = _this select 3;

switch(_richtung) do {
	
	case 0: {
		_unit setpos getMarkerpos "diamond_exit";

		inMine = true;
		[] spawn {
			while {inMine} do {musik_hoehle say3D "mine"; sleep 60;};
		};
	};

	case 1: {_unit setpos getmarkerPos "diamond_entry"; inMine = false;};
};