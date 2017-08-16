// by ALIAS
// nul = [delay] execvm "Katastrophen\alias_fallingstar.sqf";
// Tutorial: WIP

// creeaza obiect pe server
_dire	= [500,-500] call BIS_fnc_selectRandom;	
_xx = (getpos player select 0)+random _dire;
_dire	= [500,-500] call BIS_fnc_selectRandom;	
_yy = (getpos player select 1)+random _dire;
_poz_ini = [_xx, _yy, 800];
	
_falling_star_main = "Land_Battery_F" createVehicleLocal [0,0,0];
_falling_star_main setPosATL _poz_ini;

// stabileste destinatie random
_dire_dest	= [1,-1] call BIS_fnc_selectRandom;	
_xx_dest 	= _xx+(random 40000*_dire_dest);
_dire_dest	= [1,-1] call BIS_fnc_selectRandom;
_yy_dest 	= _yy+(random 40000*_dire_dest);

// creeaza lumina variabila
[_falling_star_main] execVM "Katastrophen\star_lumina.sqf";

// creeaza smoke pe client
[_falling_star_main] execVM "Katastrophen\alias_stareffect.sqf";

// deplaseaza obiect
_falling_star_main setvelocity [_xx_dest/100,_yy_dest/100,-1];

// sterge obiect si lumina dupa un anumit timp
sleep 4+random 2;
deleteVehicle _falling_star_main;