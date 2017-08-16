#include <macro.h>
/*
    Author: Joey LosPepes
    
    Description:
    Guts the animal!
*/
private["_animalCorpse","_upp","_ui","_progress","_pgText","_cP","_displayName","_itemName","_diff","_val","_handle"];
_animalCorpse = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _animalCorpse) exitWith {}; //Object passed is null?
if(life_inv_jagdmesser == 0) exitWith {hint "Du besitzt kein Jagdmesser zum Ausnehmen!"};

life_interrupted = false;
if(!((typeOf _animalCorpse) in ["Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F","Snake_random_F"])) exitWith {};
if(player distance _animalCorpse > 3.5) exitWith {};
life_action_inUse = true;
 switch(typeOf _animalCorpse) do {
    case "Hen_random_F": {_displayName = "rohes Hähnchenfleisch"; _itemName = "henraw"; _val = 1; 		life_exp = life_exp + round(random(50));};
    case "Cock_random_F": {_displayName = "rohes Hühnchenfleisch"; _itemName = "roosterraw"; _val = 1; 	life_exp = life_exp + round(random(100));};
    case "Goat_random_F": {_displayName = "rohes Ziegenfleisch"; _itemName = "goatraw"; _val = 1; 		life_exp = life_exp + round(random(200));};
    case "Sheep_random_F": {_displayName = "rohes Schafsfleisch"; _itemName = "sheepraw"; _val = 1; 	life_exp = life_exp + round(random(150));};
	////case "Snake_random_F": {_displayName = "Schlangenhaut"; _itemName = "snakeskin"; _val = 1; 			life_exp = life_exp + round(random(250));};
	case "Rabbit_F": {_displayName = "rohes Hasenfleisch"; _itemName = "rabbitraw"; _val = 1; 			life_exp = life_exp + round(random(25));};
    default {_displayName = ""; _itemName = ""; _val = 1;};
};

if (_displayName == "") exitWith {life_action_inUse = false;};

_upp = format["Entnehme %1...",_displayName];
_sleep = 0.15;
_cP = 0.01;

_handle = [_upp,_sleep,_cP,"AinvPknlMstpsnonWnonDnon_medic_1",(_this select 0),4] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
if(life_process_bad) exitWith {life_process_bad = false};

life_action_inUse = false;

if(isNull _animalCorpse) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false;
titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
_diff = [_itemName,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gutAnimal = true;
for "_i" from 0 to 2 do
deleteVehicle _animalCorpse;

if(([true,_itemName,_diff] call life_fnc_handleInv)) then {
    deleteVehicle _animalCorpse;
    titleText [format["Du hast %1 gesammelt",_displayName],"PLAIN"];
	[] call life_fnc_hudUpdate;
	[] spawn life_fnc_exptolevel;
	player selectWeapon life_curWep_h;
	} else {
    titleText ["Dein Inventar ist voll.","PLAIN"];
};