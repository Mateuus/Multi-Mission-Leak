/*
	File: fn_marker.sqf
	Author: Barney

	Description:
	Parameter:
	[Markername,Markercolor,Markertype,Markerposition,Markertext,updating,delete]

	Set delete to true if you want the marker with the given markername deleted


*/
private["_Markercolor","_Markerposition","_Markertype","_Markerposition","_delete","_markername","_marker","_Markertext"];

_markername = param [0,"",[""]];
_Markercolor = param [1,"",[""]];
_Markertype = param [2,"",[""]];
_Markerposition = param [3,[],[[]]];
_Markertext = param [4,"",[""]];
_delete = param [5,false,[false]];
_bank = param[6,false,[false]];


if(!_bank) then {
	if(_delete) then {
		deletemarkerlocal _markername;
	} else {
		_marker = createMarkerlocal [_Markername,_Markerposition];
		_marker setmarkercolorlocal _Markercolor;
		_marker setmarkertypelocal _Markertype;
		_marker setMarkerTextLocal _Markertext;
	};

} else {
	if(_delete) then {
		deletemarkerlocal "LHM_BANK_AUFGABE";
		deleteMarkerLocal "LHM_BANK_AUFGABE_BESCHREIBUNG";
	} else {
		_marker = createMarkerlocal ["LHM_BANK_AUFGABE",[6441.13,12326.6,0.00236511]];
		_marker setmarkercolorlocal "ColorOrange";
		_marker setMarkerSizelocal [500,500];
		_marker setMarkerShapelocal "ELLIPSE";
		_marker setmarkertypelocal "Empty";
		_marker setMarkerBrushLocal "Solid";
		_marker setMarkerTextLocal "Test";

		_marker1 = createMarkerlocal ["LHM_BANK_AUFGABE_BESCHREIBUNG",[6441.13,12326.6,0.00236511]];
		_marker1 setmarkercolorlocal "ColorBlack";
		_marker1 setmarkertypelocal "mil_dot";
		_marker1 setMarkerTextLocal "Suche die Höhle";

	};


};
