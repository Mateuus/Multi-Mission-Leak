/*
	File: fn_chopTree.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Chop down the targeted tree!
*/

private ["_tree","_pos2D","_pos3D","_amount"];

if (life_action_in_use) exitWith {};

if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_3") < 500 || player distance (getMarkerPos "civ_spawn_4") < 500 || player distance (getMarkerPos "civ_spawn_2") < 500) exitWith { hint "You cannot cut down a tree within city limits." };

_tree = cursorObject;

life_action_in_use = true;

if (isNull life_object_inhand) exitWith {};
if (typeOf life_object_inhand != "Land_Axe_F") exitWith {};
if (isNull _tree) exitWith {};
if (!([str _tree," t_"] call KRON_StrInStr)) exitWith {};
//if (damage _tree < 0.5) exitWith {};

_pos3D = getPos _tree;
_pos2D = [_pos3D select 0, _pos3D select 1, 0];
if ((getPosATL player) distance _pos2D > 4) exitWith {hint "You are too far from the tree to chop it."};

_height = _pos2D distance _pos3D;

_amount = round (_height / 3);
if (_amount > 4) then { _amount = 4 };

[[player,"ReloadRPG","playNow",0],"life_fnc_animSync",true,false] spawn life_fnc_MP;
playSound "chop";
sleep 2.2;
_tree setDamage 1;

if (([] call life_fnc_calTalents) < 10) then { life_experience = life_experience + (_height * 2); };
_pileSize = _amount * 5;

titleText [format["You chopped %1, and collected %2, timber from a %3m tall tree.", _amount + _pileSize, _amount, round(_height * 100) / 100],"PLAIN"];

life_action_in_use = false;

_obj = "Land_WoodPile_F" createVehicle (getPos _tree);
_obj setVariable["item",["timber",_pileSize],true];
_obj setVariable["idleTime",time,true];

if(!([true,"timber",_amount] call life_fnc_handleInv)) exitWith { titleText ["You can't carry the wood!","PLAIN"] };