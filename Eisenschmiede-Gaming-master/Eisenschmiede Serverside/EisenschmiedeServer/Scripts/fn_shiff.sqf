private["_sum","_items","_random","_delay"];

if (ES_last_gather > time - 10) exitWith { hint "You just finished gathering; wait a few seconds before gathering again." };

_items = [];
for "_i" from 1 to 20 do { _items set[count _items, "redgull"]; };
for "_i" from 1 to 30 do { _items set[count _items, "lockpick"]; };
for "_i" from 1 to 25 do { _items set[count _items, "zipties"]; };
for "_i" from 1 to 7 do { _items set[count _items, "whiskey"]; };
for "_i" from 1 to 2 do { _items set[count _items, "oil_processed"]; };
for "_i" from 1 to 10 do { _items set[count _items, "wein_refined"]; };
for "_i" from 1 to 3 do { _items set[count _items, "uran1_refined"]; };
for "_i" from 1 to 2 do { _items set[count _items, "goldbar"]; };
_items set[count _items, "diamond_cut"];

if (playerSide == west) exitWith {hint "Cops können kein Wrack Öffnen."};
if (player distance (nearestObject[player,"Land_UWreck_FishingBoat_F"]) > 50) exitWith {titleText["Du must näher an ein schiff um den Bagger nutzen zu können.","PLAIN"]};
if ((getPosASL player) select 2 > -10) exitWith {titleText["Der Bagger Benötigt mehr Wasser Druck (Du bist nicht Tief genug).","PLAIN"]};
titleText["Durchsuche das Wrack...","PLAIN"];
if (ES_action_in_use) exitWith {};
ES_action_in_use = true;

_delay = 4;
//if (65 in ES_talents) then { _delay = 3; };

_success = false;
while{ES_carryWeight < ES_maxWeight} do 
{
	if (speed player > 1) exitWith {};
	if (player distance (nearestObject[player,"Land_UWreck_FishingBoat_F"]) > 50) exitWith {titleText["Du must näher an ein schiff um den Bagger nutzen zu können.","PLAIN"]};
	if ((getPosASL player) select 2 > -10) exitWith {titleText["Der Bagger Benötigt mehr Wasser Druck (Du bist nicht Tief genug).","PLAIN"]};
	if (ES_carryWeight >= ES_maxWeight) exitWith {_success=true;};
	_random = _items select round (random ((count _items)-1));
	_sum =[_random,1,ES_carryWeight,ES_maxWeight] call ES_fnc_calWeightDiff;
	if (_sum > 0) then
	{
		ES_last_gather = time;
		if (([true,_random,1] call ES_fnc_handleInv)) then
		{
			sleep _delay;
			ES_last_gather = time;
			titleText["Du hast Truhen aus dem Wrack erhalten.","PLAIN"];
			titleFadeOut 1;
		};
	};
};
ES_action_in_use = false;

if (_success) then { titleText["Der Bagger ist Voll, check your haul!","PLAIN"]; }
else { titleText["Excavation aborted due to movement!","PLAIN"]; };

ES_last_gather = time;