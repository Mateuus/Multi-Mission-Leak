#include <macro.h>
/*
	File: fn_copMarkerZones.sqf
	Author: Jason_000
	Description: Allows police to place markers

*/
if (playerSide != west) exitWith {hint "Vous devez faire partie de la gendarmerie pour ca !"};  //cops only
if (GETC(life_coplevel) < 13) exitWith { hint "Vous n'avez pas le grade suffissant, contacter vos superieurs !"};
closeDialog 0;

marker={
	_pos = [_this select 0, _this select 1, _this select 2];
	
	_markername1 = "Restricted_Area1";
	_markername2 = "Restricted_Area2";
	
	_marker = createMarker [_markername1, [(_pos select 0), (_pos select 1), 0]];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [200, 200];
	_marker setMarkerBrush "SOLID";
	_marker setMarkerColor "ColorWEST";
	
	_marker2 = createMarker [_markername2, [(_pos select 0), (_pos select 1), 0]];
	_marker2 setMarkerColor "ColorBlack";
	_marker2 setMarkerType "mil_warning";
	_marker2 setMarkerShape "ICON";
	_marker2 setMarkerSize [1,1];
	_marker2 setMarkerText "Zone interdite au civil, intervention en cours !";
	
	//End
	onMapSingleClick "";
	openMap [false, false];
	hint "Vous avez mis un marqueur sur la carte";
    uiSleep 300;
	deleteMarker _marker;
	deleteMarker _marker2;
	hint "Votre marqueur sur la map a été retiré !";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] spawn marker";