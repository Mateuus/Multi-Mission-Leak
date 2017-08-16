
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

/*	_licht = "#lightpoint" createVehicle getpos _feuer;
	_licht lightattachObject [_feuer,[0,0,0]];
	_licht setLightBrightness 7;
	_licht setLightAmbient [0.025, 0.015, 0.015];
	_licht setLightColor [1, 0.35, 0.125];
	_licht setLightIntensity 2000;
	_licht setLightAttenuation [1,3,0,22];
	_licht setLightUseFlare true;
	_licht setLightFlareSize 0.5;
	_licht setLightFlareMaxDistance 200;*/

	_fackel enableSimulation false;

} foreach _koordinaten;