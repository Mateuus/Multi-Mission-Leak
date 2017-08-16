 
_koordinaten = [ 
[3650.53,13118.9,0.00138092], 
[3650.55,13114.6,0.00143147], 
[3650.56,13110,0.00146866],  
[3655.47,13109.8,0.00142574] 
]; 
 
{ 
_fackel = "Land_Sunshade_03_F" CreateVehicle [0,0,0]; 
_feuer = "FirePlace_burning_F" CreateVehicle [0,0,0]; 
_fackel setpos _x; 
 
_fackel setpos [(getpos _fackel select 0),(getpos _fackel select 1),(getpos _fackel select 2)-1.3];  
[_fackel, 0, -180] call BIS_fnc_setPitchBank; 
 
_feuer attachto [_fackel,[0,0,-1.45]]; 
 
 
 
 
 
 
 
 
 
 
 
 
_fackel enableSimulation false; 
 
} foreach _koordinaten;