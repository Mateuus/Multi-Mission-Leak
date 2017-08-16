private["_sum","_items","_random","_delay"];

if (isNil "ES_last_gather") then {ES_last_gather = time;};
if (ES_last_gather > time - 10) exitWith {};

_items = [];
for "_i" from 1 to 2 do { _items set[count _items, "muschelfleis"]; };
for "_i" from 1 to 1 do { _items set[count _items, "perlen"]; };
_items set[count _items, "diamond_cut"];

if (playerSide == west) exitWith {hint "Cops können keine Muscheln Öffnen."};
titleText["Öffne Muscheln...","PLAIN"];
if (ES_action_inUse) exitWith {};
ES_action_inUse = true;

_delay = 20;
//if (65 in ES_talents) then { _delay = 3; };
_JaIchBekommeWas = [true,false] call BIS_fnc_selectRandom;

_success = false;
while{ES_carryWeight < ES_maxWeight} do 
{
	if (speed player > 1) exitWith {};
	if (ES_carryWeight >= ES_maxWeight) exitWith {_success=true;};
	_random = _items select round (random ((count _items)-1));
	_sum =[_random,1,ES_carryWeight,ES_maxWeight] call ES_fnc_calWeightDiff;
	if (_sum > 0) then
	{
		ES_last_gather = time;
		if (_JaIchBekommeWas) then {
			if (([true,_random,1] call ES_fnc_handleInv)) then
			{
				sleep _delay;
				ES_last_gather = time;
				titleText["Du hast was aus der Muschel erhalten.","PLAIN"];
				titleFadeOut 1;
			};
		}else {

				sleep _delay;
				ES_last_gather = time;
				titleText["Du hast NIX aus der Muschel erhalten.","PLAIN"];
				titleFadeOut 1;
		};
	};
};
ES_action_inUse = false;

if (_success) then { titleText["Deine Taschen sind voll, check das","PLAIN"]; }
else { titleText["Aufgrund Bewegung abgebrochen!","PLAIN"]; };

ES_last_gather = time;