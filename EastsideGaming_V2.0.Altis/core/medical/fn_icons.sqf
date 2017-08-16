/*
	Datei: fn_icons.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Displays 3D Icons for Dead Players.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©Basti | John Collins 2016
*/

private _icons = addMissionEventHandler ["Draw3D", {
	{
		_down = _x getVariable ["esg_bewusstlos",false];
		if (((player distance _x) < 50) && _down) then {
			drawIcon3D ["\A3\ui_f\data\map\mapcontrol\Hospital_CA.paa", [0.6,0.15,0,0.9], _x, 0.7, 0.7, 0, format ["%1 (%2m)", _x getVariable ["realname",name _x], ceil (player distance _x)], 0, 0.05];
		};
	} forEach playableUnits;
}];