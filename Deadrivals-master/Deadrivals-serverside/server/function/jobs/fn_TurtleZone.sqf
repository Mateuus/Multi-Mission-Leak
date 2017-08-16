private["_animalList","_dist","_radius","_zoneName","_unitsNear","_animalsActive"]; 
[] spawn { 
while {true} do { 
_zoneName = ["turtle_spawn_1","turtle_spawn_2","turtle_spawn_3","turtle_spawn_4","turtle_spawn_5","turtle_spawn_6","turtle_spawn_7","turtle_spawn_8"]; 
_randomzone = selectRandom _zoneName; 
 
_zone = getMarkerPos _randomzone; 
 
NOCRIS_TURTLE_MARKER_TEXT = createMarker [format["%1_markertext",_randomzone],_zone]; 
_mullname = "Schildkröten Schwarm"; 
NOCRIS_TURTLE_MARKER_TEXT setMarkerText _mullname; 
NOCRIS_TURTLE_MARKER_TEXT setMarkerColor "ColorRed"; 
NOCRIS_TURTLE_MARKER_TEXT setMarkerType "loc_SmallTree"; 
NOCRIS_TURTLE_MARKER_TEXT setMarkerSize [1,1]; 
 
NOCRIS_TURTLE_MARKER_RADIUS = createMarker [format["%1_markerradius",_randomzone],_zone]; 
NOCRIS_TURTLE_MARKER_RADIUS setMarkerColor "ColorRed"; 
NOCRIS_TURTLE_MARKER_RADIUS setMarkerShape "ELLIPSE"; 
NOCRIS_TURTLE_MARKER_RADIUS setMarkerBrush "SolidBorder"; 
NOCRIS_TURTLE_MARKER_RADIUS setMarkerSize [150,150]; 
sleep (20 * 60); 
deleteMarker NOCRIS_TURTLE_MARKER_TEXT; 
deleteMarker NOCRIS_TURTLE_MARKER_RADIUS; 
}; 
}; 
 
while {true} do { 
_maxAnimals = 30; 
_radius = (getMarkerSize NOCRIS_TURTLE_MARKER_RADIUS) select 0; 
_dist = _radius + 200; 
 
if (!isNil "animals" && {count animals != 0}) then { 
_maxAnimals = _maxAnimals - count(animals); 
} else { 
animals = []; 
}; 
 
_unitsNear = false; 
_animalsActive = false; 
{if ((_x distance _zone) < _dist) exitWith {_unitsNear = true;}; _unitsNear = false;} forEach playableUnits; 
if (_unitsNear && !_animalsActive) then { 
_animalsActive = true; 
for "_i" from 1 to _maxAnimals do { 
_position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0]; 
_animal = createAgent ["Turtle_F",_position,[],0,"FORM"]; 
_animal setDir (random 360); 
animals pushBack _animal; 
}; 
} else { 
if (!_unitsNear && _animalsActive) then { 
{deleteVehicle _x;} forEach animals; 
animals = []; 
_animalsActive = false; 
}; 
}; 
uiSleep (3 + random 2); 
};