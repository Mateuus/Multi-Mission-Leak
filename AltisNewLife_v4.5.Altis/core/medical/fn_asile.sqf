#include <macro.h>
private["_unit","_rate"];
_rate = 1000;
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "null Target"};
if(!(_unit getVariable ["restrained",false])) exitWith {hint "La victime n'a pas de camisole"};
if(playerSide == west) exitWith {hint "Les flics meme si ils le sont ne peuvent pas etre enfermé"};
if(side _unit == independent) exitWith {hint "Les medecins ne peuvent pas etre mis dans un asile"};
if(!isPlayer _unit) exitWith {hint "Ce n'est pas un humain"};
if((player distance (getMarkerPos "asile_marker") < 90)) then
{
	detach _unit;
	[[_unit,false],"life_fnc_asileAction",_unit,false] spawn life_fnc_MP;
};
argent_liquide = argent_liquide + _rate;
hint "Vous avez empecher un fou d'agir, vous avez gagné 1000€";