#include <macro.h>
private["_corpse","_animals","_success","_num"];
_corpse = life_cursorTarget;
_animals = ["Cock_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Rabbit_F"];
if (isNull _corpse || !((typeOf _corpse) in _animals) || alive _corpse) exitWith { hint "Tu ne pourras pas recuperer de la viande dessus !"; };
[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 5.2;
_success = false;
_item = switch (typeOf _corpse) do
{
	case "Cock_random_F": { "roosterraw" };
	case "Hen_random_F": { "henraw" };
	case "Sheep_random_F": { "sheepraw" };
	case "Goat_random_F": { "goatraw" };
	case "Rabbit_F": { "rabbitraw" };
	default { "" };
};
_num = ceil(random 3);
if (_item != "") then { _success = [true,_item,_num] call life_fnc_handleInv; };
if (_success) then { [[0,2], format["Vous avez decoupé %1 morceau de viande.",_num]] call life_fnc_broadcast; }
else { [[0,2], "Vous ne pouvez pas en recuperer. Votre inventaire est sans doute plein !"] call life_fnc_broadcast; };
deleteVehicle _corpse;