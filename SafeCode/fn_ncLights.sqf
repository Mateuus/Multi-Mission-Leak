_trueorfalse = nc_light getVariable["nclights",FALSE];

if(_trueorfalse) then {
	nc_light setVariable["nclights",FALSE,TRUE];
	hint "Turning off lights. This may take a second.";
} else {
	nc_light setVariable["nclights",TRUE,TRUE];
	[[nc_light,0.22],"life_fnc_ncLightsOn",true,false] call life_fnc_MP;
};