/*
	Datei: fn_getLoadout.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Füllt die Listbox für die Loadouts.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);

_lO1 = ((ESG_loadout select 0) select 0);
_lO1_name = ((ESG_loadout select 0) select 1);

_lO2 = ((ESG_loadout select 1) select 0);
_lO2_name = ((ESG_loadout select 1) select 1);

_lO3 = ((ESG_loadout select 2) select 0);
_lO3_name = ((ESG_loadout select 2) select 1);

_lO4 = ((ESG_loadout select 3) select 0);
_lO4_name = ((ESG_loadout select 3) select 1);

_lO5 = ((ESG_loadout select 4) select 0);
_lO5_name = ((ESG_loadout select 4) select 1);

_lb lbAdd format ["%1 - Slot 1",_lO1_name];
_lb lbSetData[(lbSize _lb) - 1, str(_lO1)];

_lb lbAdd format ["%1 - Slot 2",_lO2_name];
_lb lbSetData[(lbSize _lb) - 1, str(_lO2)];

_lb lbAdd format ["%1 - Slot 3",_lO3_name];
_lb lbSetData[(lbSize _lb) - 1, str(_lO3)];

_lb lbAdd format ["%1 - Slot 4",_lO4_name];
_lb lbSetData[(lbSize _lb) - 1, str(_lO4)];

_lb lbAdd format ["%1 - Slot 5",_lO5_name];
_lb lbSetData[(lbSize _lb) - 1, str(_lO5)];

_lb lbsetCurSel 0;