/*
	File: fn_gatherAction.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master gathering script, to replace all inferior scripts!
*/

private["_sum","_stones","_originalPos"];

_item = [_this select 3,0,"",[""]] call BIS_fnc_param;
_count = [_this select 3,1,1,[1]] call BIS_fnc_param;

if (_item in ["cannabis","heroinu"]) exitWith { (_this select 3) spawn life_fnc_zoneGather; };

if (life_action_in_use) exitWith {hint "You're too busy to gather right now."};
if (life_last_gather > time - 10) exitWith { hint "You just finished gathering; wait a few seconds before gathering again." };

_stones = ["diamond","copperore","ironore","rock"];

if (life_inv_pickaxe < 1 && _item in _stones) exitWith { hint "You must have a pickaxe in order to gather this resource."; };

if (_item == "ephedrau" && 9 in life_gangtalents) then { if (random 3 < 1) then { _count = _count + 1 } };
if ((_item == "copperore") && (49 in life_talents)) then { _count = _count + 1; };
if ((_item == "ironore") && !(51 in life_talents)) exitWith { hint "You must have the talent Iron Miner to mine iron ore."; };
if ((_item == "diamond") && !(52 in life_talents)) exitWith { hint "You must have the talent Diamond Miner to mine diamonds."; };
//if ((_item == "oil") && !(105 in life_talents)) exitWith { hint "You must have the talent Oil Runner to gather oil."; };

_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;

titleText[format["Gathering %1...",_itemName],"PLAIN"];
_originalPos = getPos player;
life_action_in_use = true;

if (_item in _stones) then
{
	[] spawn
	{
		private ["_i"];
		_i = 0;
		while {life_action_in_use} do
		{
			if (_i == 0) then { [[player, "pickaxe",10],"life_fnc_playSound",true,false] spawn life_fnc_MP; _i = 1; }
			else { _i = 0; };
			player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			waitUntil{animationState player != "ainvpercmstpsnonwnondnon_putdown_amovpercmstpsnonwnondnon";};
			//sleep 2.5;
		};
	};
};

while {life_carryWeight < life_maxWeight} do
{
	life_last_gather = time;
	if (!(alive player)) exitWith {};
	if (speed player > 1 || player distance _originalPos > 2 || !life_action_in_use) exitWith { titleText["Gathering aborted. You must remain still while gathering.","PLAIN"]; };
	if (life_carryWeight >= life_maxWeight) exitWith { titleText [format["Gathering done. You can't hold more %1.", _itemName],"PLAIN"]; };
	_sum = [_item,_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_sum > 0) then
	{
		sleep 5;
		life_last_gather = time;
		if (!life_action_in_use) exitWith {};
		if(!([true,_item,_count] call life_fnc_handleInv)) exitWith
		{
			titleText [format["Gathering done. You can't hold more %1.", _itemName],"PLAIN"];
		};
		titleText [format["Gathered %1 %2. [%3/%4]",_count,_itemName,life_carryWeight,life_maxWeight],"PLAIN"];
		if (random 120 < 1) then { [true,"lootcrate1",1] call life_fnc_handleInv; titleText ["You found a loot crate!","PLAIN"]; };
		titleFadeOut 1;
		if (([] call life_fnc_calTalents) < 6) then { life_experience = life_experience + 1; };
		//[[6, player, format["Picked %1 %2", _sum, _itemName]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};

life_action_in_use = false;
life_last_gather = time;