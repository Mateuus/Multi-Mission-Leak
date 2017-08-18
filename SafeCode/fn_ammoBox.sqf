/*
	File: fn_ammoBox.sqf
	Author: Kevin Webb
	
	Description:
	Spawns an ammo box for multi-purpose use. Mainly for the igiLoad script.
*/
private["_crate"];
_crate = [_this,0,"",[""]] call BIS_fnc_param;

switch (_crate) do
{
	case "ammoBox":
	{
		_crate = "IG_supplyCrate_F" createVehicle [0,0,0];
		life_carryweight = life_carryweight - 30;
	};
	
	case "ammoBoxS":
	{
		_crate = "Box_NATO_Grenades_F" createVehicle [0,0,0];
		life_carryweight = life_carryweight - 15;
	};
};

_crate attachTo[player,[0,5.5,0]];
detach _crate;
hint "You have deployed a storage crate.";
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_crate allowDamage false;
_crate enableRopeAttach false;
_crate setVariable["locked_crate",true,true];
player setVariable["myCrate",true,true];