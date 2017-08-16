
_vehicle = _this select 0;
_color = _this select 1;

_weapons = ["1000Rnd_Gatling_30mm_Plane_CAS_01_F","2Rnd_Missile_AA_04_F","6Rnd_Missile_AGM_02_F","4Rnd_Bomb_04_F","7Rnd_Rocket_04_HE_F","7Rnd_Rocket_04_AP_F","120Rnd_CMFlare_Chaff_Magazine"]; 
{_vehicle removeMagazinesTurret [_x,[-1]]} foreach _weapons;
{_vehicle removeWeapon _x} forEach weapons _vehicle;

_bank = "Land_Pod_Heli_Transport_04_covered_F" createvehicle [0,0,0];
_bank attachto[_vehicle,[0,-4.7,2]];

_bank2 = "Land_Pod_Heli_Transport_04_covered_F" createvehicle [0,0,0]; //getmarkerpos "temp";
_bank2 attachto[_vehicle,[0,2,2]];
_bank2 setdir 180;

switch(_color) do {

	case 0: {
		_bank setobjecttextureglobal [0,""];
		_bank setobjecttextureglobal [1,"#(argb,8,8,3)color(0,0,0,1)"];
		_bank2 setobjecttextureglobal [0,""];
		_bank2 setobjecttextureglobal [1,"#(argb,8,8,3)color(0,0,0,1)"];
	};
	
	case 1: {
		_bank setobjecttextureglobal [0,"#(argb,8,8,3)color(0.5,0.2,0,0.4)"];
		_bank setobjecttextureglobal [1,"#(argb,8,8,3)color(1,1,1,0.4)"];
		_bank2 setobjecttextureglobal [0,"#(argb,8,8,3)color(0.5,0.2,0,0.4)"];
		_bank2 setobjecttextureglobal [1,"#(argb,8,8,3)color(1,1,1,0.4)"];
	};
};