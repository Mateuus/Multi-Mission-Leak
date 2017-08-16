private["_container","_unit","_retext"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
//if(_isPack == 1) then {
if(_isPack == 1 && playerSide != west) then {
	hint "Vous ne pouvez pas regarder à l'interieur de ce sac";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "Vous n'etes pas autorisé a acceder à ce stockage, tant que le proprietaire ne l'ouvre pas !";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
	hint "Vous n'etes pas autorisé a acceder à ce stockage, tant que le proprietaire ne l'ouvre pas !";
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
	};
};
};

_retext = 0;
{	if((playerSide == _x select 2) && ((uniform player) == _x select 0)) then {	_retext = 1;};
} foreach ANL_uniforme;
if (_retext > 0) then { [] call life_fnc_uniform; };