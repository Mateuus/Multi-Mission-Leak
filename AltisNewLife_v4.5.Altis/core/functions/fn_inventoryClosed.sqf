private["_container","_retext"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];
	
	switch(true) do {
		case (count _house == 0): {_exit = true;};
		case (count _house == 1): {_house = _house select 0;};
		default {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} foreach _house;
		};
	};
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat "Erreur en sauvegardant, ne trouve pas de maison a cote !"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
};

_retext = 0;
{	if((playerSide == _x select 2) && ((uniform player) == _x select 0)) then {	_retext = 1;};
} foreach ANL_uniforme;
if (_retext > 0) then { [] call life_fnc_uniform; };