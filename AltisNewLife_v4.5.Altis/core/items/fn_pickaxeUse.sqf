#include <macro.h>
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = ceil(random 6);};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = ceil(random 6);};
	case (player distance (getMarkerPos "salt_1") < 120): {_mine = "salt"; _val = ceil(random 12);};
	case (player distance (getMarkerPos "sand_1") < 75): {_mine = "sand"; _val = ceil(random 15);};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = ceil(random 3);};
	case (player distance (getMarkerPos "oil_1") < 40): {_mine = "oilu"; _val = ceil(random 3);};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = ceil(random 6);};
	case (player distance (getMarkerPos "or_1") < 50): {_mine = "orr"; _val = ceil(random 2);};
	case (player distance (getMarkerPos "osmium_1") < 40): {_mine = "osmium"; _val = ceil(random 2);};
	case (player distance (getMarkerPos "palladium_1") < 40): {_mine = "palladium"; _val = ceil(random 2);};
	default {_mine = "";};
};
if(_mine == "") exitWith {hint "Tu n'es pas à coté de la mine !"};
if(vehicle player != player) exitWith {hint "Tu devrais ouvrir la fenêtre pour miner depuis ton véhicule.";};
_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Votre inventaire est plein."};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};

	life_action_in_use = true;
	// Show progress during 2 sec
	["Vous piochez...", 2] call life_fnc_showProgress;
	life_action_in_use = false;
};
if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = ITEM_NAME(_mine);
	playSound "bag";
	titleText[format["Tu as recuperé %2 %1",localize _itemName,_diff],"PLAIN"];
};
life_action_inUse = false;