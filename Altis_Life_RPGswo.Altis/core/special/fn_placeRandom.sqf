/*
	File: fn_placeRandom.sqf
	Autor: MarkusSR1984
	
	Description: 	Plaziert das Übergebene Object Zufällig auf der Karte
					Ausgenommen auf Wasser oder auf Straßen
	
Übergebene Werte:
Objekt ( player, unit, vehicle,etc... )

*/
_object = _this select 0;

_foundNewPos = false;
_newPos = [0,0,0];

while {!_foundNewPos} do
	{
		_newPos = [random 30700,random 30700,0];



		if (!(surfaceIsWater _newPos) && !(isOnRoad _newPos)) then {_foundNewPos = true;};
	};
	
_object setPosATL _newPos;