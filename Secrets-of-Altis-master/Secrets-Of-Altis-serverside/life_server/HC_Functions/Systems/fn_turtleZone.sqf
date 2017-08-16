 
 
 
 
 
 
private["_radius","_animals","_zoneName","_zones"]; 
_zones = ["turtle_1","turtle_2","turtle_3"]; 
 
{ 
_radius = (getMarkerSize _x) select 0; 
_zone = getMarkerPos _x; 
_animals = []; 
 
for "_i" from 1 to 50 do { 
_position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0]; 
_animal = createAgent ["Turtle_F",_position,[],0,"NONE"]; 
_animal setDir (random 360); 
_animals pushBack _animal; 
}; 
} foreach _zones;