if (playerSide == independent) exitWith {};
if (playerSide == civilian) exitWith {};
if((call ES_coplevel) < 6) exitWith { hint "Erst ab Commissioner!"};
closeDialog 0;

marker={
	_pos = [_this select 0, _this select 1, _this select 2];
	
	_markername1 = "Restricted_Area1";
	_markername2 = "Restricted_Area2";
	
	_marker = createMarker [_markername1, [_pos select 0, _pos select 1, 0]];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [200, 200];
	_marker setMarkerBrush "SOLID";
	_marker setMarkerColor "ColorYellow";

	_marker2 = createMarker [_markername2, [_pos select 0, _pos select 1, 0]];
	_marker2 setMarkerColor "ColorBlack";
	_marker2 setMarkerType "mil_warning";
	_marker2 setMarkerShape "ICON";
	_marker2 setMarkerSize [1,1];
	_marker2 setMarkerText "Polizei Sperrgebiet!";
	
	onMapSingleClick "";
	openMap [false, false];
	hint "Sie haben die Markierung auf der Karte platziert!";
	sleep 300;
	deleteMarker _marker;
	deleteMarker _marker2;
	hint "Ihre Markierung auf der Karte wurde entfernt!";
};

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] spawn marker";