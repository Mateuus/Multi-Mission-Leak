/*
	File: fn_mining.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master mining script!
*/

private["_sum","_stones","_items","_random","_delay"];

_yield = switch(true) do {
	case ({player distance getMarkerPos format["mine_%1",_x] < 100} count [1,3,4] > 0): {1};
	case (player distance (getMarkerPos "mine_2") < 100): {0.7};
	case ({player distance getMarkerPos format["mine_%1",_x] < 100} count [5,6,7] > 0): {2};
};

if (life_inv_pickaxe < 1) exitWith { hint "You must have a pickaxe in order to gather this resource."; };
if (vehicle player != player) exitWith { hint "You can't mine from within a vehicle."; };
if (life_last_gather > time - 10) exitWith { hint "You just finished gathering; wait a few seconds before gathering again." };
if (life_action_in_use) exitWith {};

titleText[format["Mining..."],"PLAIN"];

[] spawn
{
	private ["_i"];
	_i = 0;
	while {life_action_in_use} do
	{
		if (_i == 0) then { [[player, "pickaxe",10],"life_fnc_playSound",true,false] spawn life_fnc_MP; _i = 1; }
		else { _i = 0; };
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		sleep 2.5;
	};
};

life_action_in_use = true;

_startPos = getPos player;
_delay = 4;
if (50 in life_talents) then { _delay = 3; };

_success = false;
_abort = false;
while{life_carryWeight < life_maxWeight - 3} do 
{
	if (speed player > 2) exitWith {};
	if (player distance _startPos > 4) exitWith {};
	if (vehicle player != player) exitWith {};
	if (!life_action_in_use) exitWith {};
	if (life_carryWeight >= life_maxWeight) exitWith {_success=true;};
	_random = switch (true) do
	{
		case (!life_is_arrested && !(49 in life_talents) && floor (random (4 * _yield)) < 1): {"rock" };
		case (!life_is_arrested && floor (random (5000 / _yield)) < 1): { ["treasure_1","treasure_2","treasure_3","treasure_4","treasure_5"] call BIS_fnc_selectRandom };
		case (!life_is_arrested && floor (random (500 / _yield)) < 1): { "diamondf" };
		case (!life_is_arrested && floor (random (150 / _yield)) < 1): { "lootcrate1" };
		case (!life_is_arrested && floor (random (6 / _yield)) < 1): { "diamond" };
		case (!life_is_arrested && (52 in life_talents) && floor (random (3 / _yield)) < 1): {"diamond" };
		case (!life_is_arrested && floor (random (4 / _yield)) < 1): { "ironore" };
		case (!life_is_arrested && (51 in life_talents) && floor (random (3 / _yield)) < 1): {"ironore" };
		case (!life_is_arrested && floor (random (3 / _yield)) < 1): { "copperore" };
		case (!life_is_arrested && floor (random (4 / _yield)) < 1): { "sand" };
		default { "rock" };
	};
	life_last_gather = time;
	if (_random == "rock" && !life_is_arrested) then
	{
		sleep _delay;
		titleText[format["You found only worthless rock."],"PLAIN"];
		titleFadeOut 2;
	}
	else
	{
		if (!([true,_random,1] call life_fnc_handleInv)) exitWith {_abort=true; _success = true;};
		sleep _delay;
		titleText[format["You have collected %1.", [([_random,0] call life_fnc_varHandle)] call life_fnc_varToStr],"PLAIN"];
		titleFadeOut 2;
		if (([] call life_fnc_calTalents) < 10) then { life_experience = life_experience + 2; };
	};
	life_last_gather = time;
	if (_abort) exitWith {};
};
life_action_in_use = false;

titleText["Mining complete!","PLAIN"];
life_last_gather = time;