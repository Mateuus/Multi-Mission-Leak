private["_query","_meds","_atac","_cops","_civ"]; 
while {true} do { 
_meds = []; 
_atac = []; 
_cops = []; 
_civ = []; 
 
{ 
if(side _x == west) then 
{ 
_cops pushBack _x; 
}; 
} foreach playableUnits; 
 
{ 
if(side _x == independent && (_x getvariable "Dienst" == "MED")) then 
{ 
_meds pushBack _x; 
}; 
} foreach playableUnits; 
 
{ 
if(side _x == independent && (_x getvariable "Dienst" == "ABAC")) then 
{ 
_atac pushBack _x; 
}; 
} foreach playableUnits; 
 
{ 
if(side _x == civilian) then 
{ 
_civ pushBack _x; 
}; 
} foreach playableUnits; 
 
_gesamtspieler = (count _cops) + (count _meds) + (count _atac) + (count _civ); 
 
_query = format["INSERT INTO serverstatistik SET gesamtanzahl = '%1', cop = '%2', med = '%3', atac = '%4', civ = '%5'",_gesamtspieler,(count _cops),(count _meds),(count _atac),(count _civ)]; 
[_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
sleep (5 * 60); 
}; 
