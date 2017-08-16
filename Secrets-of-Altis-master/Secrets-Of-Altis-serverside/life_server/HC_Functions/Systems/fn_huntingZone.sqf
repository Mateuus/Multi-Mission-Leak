 
 
 
 
 
 
private["_animalList","_dist","_radius","_animals","_zoneName","_unitsNear","_animalsActive"]; 
_zoneName = _this select 0; 
_maxAnimals = _this select 1; 
if(_zoneName == "") exitWith {}; 
_animalList = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F"]; 
_radius = (getMarkerSize _zoneName) select 0; 
_dist = _radius + 100; 
_zone = getMarkerPos _zoneName; 
_animals = []; 
 
for "_i" from 1 to _maxAnimals do { 
_animalClass = _animalList select floor random count _animalList; 
_position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0]; 
_animal = createAgent [_animalClass,_position,[],0,"FORM"]; 
_animal setDir (random 360); 
_animals pushBack _animal; 
};