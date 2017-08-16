/*
	File: fn_zoneGather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Gather an object based on distance and stuff
*/

private["_item","_count"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_count = [_this,1,1,[1]] call BIS_fnc_param;

if (time - life_last_gather < 3) exitWith {};
if (life_action_in_use) exitWith {};

if ((life_turf_list select 0) select 1 == life_gang) then { _count = floor(_count * 2); };

_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;

life_last_gather = time;
life_action_in_use = true;

_objects = nearestObjects [player, ["UserTexture_1x2_F"], 2];
if (count _objects < 1) exitWith { titleText[format["Could not reach a %1.", _itemName],"PLAIN"]; life_action_in_use = false; };
titleText[format["Gathering nearby %1...", _itemName],"PLAIN"];
[[player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon","switch",0],"life_fnc_animSync",true,false] spawn life_fnc_MP;
sleep 0.8;
_objPos = getPos (_objects select 0);
_clusterParts = nearestObjects [_objPos, ["UserTexture_1x2_F"], 0.1];
{ deleteVehicle _x } forEach _clusterParts;

if (_item in ["cannabis","heroinu"] && 8 in life_gangtalents) then
{
	if (random 3 < 1) then { _count = _count + 1 };
};

_sum = [_item,_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_sum < 1) exitWith { titleText [format["You can't hold any more %1.", _itemName],"PLAIN"]; life_action_in_use = false; };

if(!([true,_item,_count] call life_fnc_handleInv)) exitWith
{
	titleText [format["Gathering failed. You can't hold more %1.", _itemName],"PLAIN"];
	life_action_in_use = false;
};
titleText [format["Gathered %1 %2. [%3/%4]",_count,_itemName,life_carryWeight,life_maxWeight],"PLAIN"];
titleFadeOut 1;
if (([] call life_fnc_calTalents) < 6) then { life_experience = life_experience + 2; };

life_action_in_use = false;