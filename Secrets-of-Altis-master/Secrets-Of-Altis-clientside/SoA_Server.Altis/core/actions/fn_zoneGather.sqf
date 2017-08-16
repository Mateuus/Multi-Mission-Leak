private["_item","_count","_array","_sum","_level","_exp"];

_exp = 0;
_level = 0;
_count = 0;

_item = _this select 3;
switch (_item) do {
	case "cannabis": {_count = [1,3] call life_fnc_randomRound; _exp = 100; _level = 5};
	case "heroinu": {_count = [1,3] call life_fnc_randomRound; _exp = 200; _level = 7};
	case "cocaine": {_count = [1,3] call life_fnc_randomRound; _exp = 150; _level = 6};
	case "diamond": {_count = [1,3] call life_fnc_randomRound; _exp = 150; _level = 6};
	case "tomate": {_count = [1,3] call life_fnc_randomRound; _exp = 30; _level = 1};
	case "salat": {_count = [1,3] call life_fnc_randomRound; _exp = 30; _level = 1};
	case "banane": {_count = [1,2] call life_fnc_randomRound; _exp = 50; _level = 2};
	case "tabakblatt": {_count = [1,2] call life_fnc_randomRound; _exp = 50; _level = 4};
	case "plutoniumu": {_count = 1; _exp = 200; _level = 8};
};

if (time - life_gathertime < 3) exitWith {};
if (life_action_in_use) exitWith {};

_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;

life_gathertime = time;
life_action_in_use = true;

_objects = nearestObjects [player, ["UserTexture_1x2_F"], 2];
if (count _objects < 1) exitWith { titleText[format["%1 ist zu weit entfernt!", _itemName],"PLAIN"]; life_action_in_use = false; };
titleText[format["Sammle %1...", _itemName],"PLAIN"];
player playmove "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";
sleep 0.8;
if(_item in ["diamond","plutoniumu"]) then {player say3D "pickaxe"};
_objPos = getPos (_objects select 0);
_clusterParts = nearestObjects [_objPos, ["UserTexture_1x2_F"], 0.1];
{ deleteVehicle _x } forEach _clusterParts;


_sum = [_item,_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_sum < 1) exitWith { titleText [format["Du kannst nicht mehr %1 aufnehmen.", _itemName],"PLAIN"]; life_action_in_use = false; };

if(!([true,_item,_count] call life_fnc_handleInv)) exitWith
{
	titleText [format["Du kannst nicht mehr %1 aufnehmen.", _itemName],"PLAIN"];
	life_action_in_use = false;
};

titleText [format["%2 (%1x) gesammelt. [%3/%4kg]",_count,_itemName,life_carryWeight,life_maxWeight],"PLAIN"];
titleFadeOut 2;

if(life_level < _level) then {_exp = (_exp/2)};
life_exp = life_exp + round(random(_exp));
[] spawn life_fnc_exptolevel;

life_action_in_use = false;