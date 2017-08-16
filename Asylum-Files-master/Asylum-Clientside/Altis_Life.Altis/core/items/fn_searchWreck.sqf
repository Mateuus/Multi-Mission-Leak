/*
	File: fn_searchWreck.sqf
	Author: Mike "Revir" Berlin

	Description:
	Searches shipwrecks for the items within the _items array.
*/
private["_sum","_items","_random","_delay"];

if (life_last_gather > time - 10) exitWith { hint "You just finished gathering; wait a few seconds before gathering again." };

_items = [];
for "_i" from 1 to 20 do { _items set[count _items, "silverpiece"]; };
for "_i" from 1 to 30 do { _items set[count _items, "lockpick"]; };
for "_i" from 1 to 25 do { _items set[count _items, "ziptie"]; };
for "_i" from 1 to 7 do { _items set[count _items, "oilp"]; };
for "_i" from 1 to 10 do { _items set[count _items, "doubloon"]; };
for "_i" from 1 to 3 do { _items set[count _items, "pearl"]; };
for "_i" from 1 to 2 do { _items set[count _items, "ruby"]; };
_items set[count _items, "diamondf"];

if (playerSide == west) exitWith {hint "Cops cannot search wrecks."};
if (player distance (nearestObject[player,"Land_UWreck_FishingBoat_F"]) > 50) exitWith {titleText["You need to be closer to a ship wreck to use the excavator.","PLAIN"]};
if ((getPosASL player) select 2 > -10) exitWith {titleText["The excavator requires more water pressure (you're not deep enough).","PLAIN"]};
titleText["Searching Wreck...","PLAIN"];
if (life_action_in_use) exitWith {};
life_action_in_use = true;

_delay = 4;
if (65 in life_talents) then { _delay = 3; };

_success = false;
while{life_carryWeight < life_maxWeight} do 
{
	if (speed player > 1) exitWith {};
	if (player distance (nearestObject[player,"Land_UWreck_FishingBoat_F"]) > 50) exitWith {titleText["You need to be closer to a ship wreck to use the excavator.","PLAIN"]};
	if ((getPosASL player) select 2 > -10) exitWith {titleText["The excavator requires more water pressure (you're not deep enough).","PLAIN"]};
	if (life_carryWeight >= life_maxWeight) exitWith {_success=true;};
	_random = if (random 3000 < 1) then { ["treasure_1","treasure_2","treasure_3","treasure_4","treasure_5"] call BIS_fnc_selectRandom } else { _items select round (random ((count _items)-1)) };
	_sum =[_random,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if (_sum > 0) then
	{
		life_last_gather = time;
		if (([true,_random,1] call life_fnc_handleInv)) then
		{
			sleep _delay;
			life_last_gather = time;
			titleText["You have collected some treasure from the wreck.","PLAIN"];
			titleFadeOut 1;
			if (([] call life_fnc_calTalents) < 10) then { life_experience = life_experience + 2; };
			//[[6, player, format["Found %1 %2.",_sum,_random]],"ASY_fnc_logit",false,false] spawn life_fnc_MP;
		};
	};
};
life_action_in_use = false;

if (_success) then { titleText["The excavator is full, check your haul!","PLAIN"]; }
else { titleText["Excavation aborted due to movement!","PLAIN"]; };

life_last_gather = time;

