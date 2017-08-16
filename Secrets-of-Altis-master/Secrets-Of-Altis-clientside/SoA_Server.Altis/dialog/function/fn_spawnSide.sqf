disableSerialization;
closedialog 0;

_mode = _this select 0;
_spawn = "";

if(life_spawned) exitWith {hint "Du bist heute schon geflogen.";};

switch(playerside) do {

	case west: {
		
		switch(_mode) do {
			case "kavala": {_spawn = "cop_spawn_1"};
			case "athira": {_spawn = "cop_spawn_6"};
			case "pyrgos": {_spawn = "cop_spawn_2"};
			case "sofia": {_spawn = "cop_spawn_5"};
			case "flughafen": {_spawn = "cop_spawn_7"};
		};
	};

	case civilian: {

		switch(_mode) do {
			case "kavala": {_spawn = "civ_spawn_1"};
			case "athira": {_spawn = "civ_spawn_3"};
			case "pyrgos": {_spawn = "civ_spawn_2"};
			case "sofia": {_spawn = "civ_spawn_4"};
			case "flughafen": {_spawn = "civ_spawn_5"};
			case "house": {_spawn = (life_spawn_point select 0)};
		};
	};

	case independent: {

		switch(_mode) do {
			case "kavala": {_spawn = "medic_spawn_1"};
			case "athira": {};
			case "pyrgos": {_spawn = "medic_spawn_2"};
			case "sofia": {_spawn = "medic_spawn_3"};
			case "flughafen": {_spawn = "medic_spawn_4"};
		};
	};
};

life_spawned = true;

if(_mode != "flughafen") then {
	2 cutFadeOut 1;
	0 cutText ["1 Stunde später...","BLACK OUT",3];
	sleep 2;
	playsound "plane";
	playsound "bling";
	waitUntil{sleep 0.1; preloadCamera getMarkerPos _spawn};
	0 cutFadeOut 1;
	[] call life_fnc_hudSetup;
};

//createdialog "aktion";

if(playerside == civilian && !(_mode in ["house","flughafen"])) exitWith {
	_rndsel = nearestObjects[getMarkerPos _spawn, ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
	
	_rndsel = _rndsel call BIS_fnc_selectRandom;
	player setPosATL (_rndsel buildingPos 0);
};

player setposATL getMarkerPos _spawn;

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
};