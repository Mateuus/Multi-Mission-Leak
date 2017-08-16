// by ALIAS
// nul = [] execvm "Katastrophen\alias_meteor.sqf";
// Tutorial: WIP
//_delay_meteor = _this select 0;


	// creeaza obiect
	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx = (getpos player select 0)+random _dire;
	_dire	= [1000,-1000] call BIS_fnc_selectRandom;	
	_yy = (getpos player select 1)+random _dire;
	_poz_ini = [_xx, _yy, 800];
		
	_falling_meteor_main = "Land_Battery_F" createVehicleLocal [0,0,0];
	_falling_meteor_main setPosATL _poz_ini;
	
	// lumina
	[_falling_meteor_main] execVM "Katastrophen\meteor_ini_blast.sqf";
	
	// sunet bariera sonica
	_bariera_sunet = ["bariera_1","bariera_2","bariera_3","bariera_4", "bariera_5"] call BIS_fnc_selectRandom;	
	_falling_meteor_main say3D _bariera_sunet;
	
	// stabileste destinatie random
	_dire_dest	= [1000,-1000] call BIS_fnc_selectRandom;	
	_xx_dest 	= _xx+random _dire_dest;
	_dire_dest	= [1,-1] call BIS_fnc_selectRandom;
	_yy_dest 	= _yy+random _dire_dest;
	
	// creeaza smoke pe client
	[_falling_meteor_main] execVM "Katastrophen\alias_meteoreffect.sqf";
	
	// deplaseaza obiect
	_falling_meteor_main setvelocity [_xx_dest/200,_yy_dest/200,-100];
	
	while {((getpos _falling_meteor_main) select 2) >10} do	{
		_falling_meteor_main say3D "meteor_1";
		sleep 0.9;
	};

	_poz_end = getPos _falling_meteor_main;
	deleteVehicle _falling_meteor_main;
	
	// genereaza explozia si effect explozie	
	[_poz_end] execVM "Katastrophen\meteor_end_blast.sqf";
	
	_meteor_voice = "land_helipadempty_f" createVehicleLocal [0,0,0];
	_meteor_voice say3D "expozie";
	enableCamShake true;
	addCamShake [3, 5, 35];
	sleep 1+random 1;
	addCamShake [0.5, 30, 35];
	
//	sterge obiect si lumina dupa un anumit timp
	sleep 5;
	enableCamShake false;
	deleteVehicle _meteor_voice;
