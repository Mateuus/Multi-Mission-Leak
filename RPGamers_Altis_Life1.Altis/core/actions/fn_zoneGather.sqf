#include "..\..\script_macros.hpp"

private["_item","_count"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_count = [_this,1,1,[1]] call BIS_fnc_param;

if (time - life_last_gather < 3) exitWith {};
if (life_action_in_use) exitWith {};

if ((life_turf_list select 0) select 1 == life_gang) then { _count = floor(_count * 2); };

_itemName = M_CONFIG(getText,"VirtualItems",_item,"displayName");

life_last_gather = time;
life_action_in_use = true;

_sum = [_item,_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_sum < 1) exitWith { [format["You can't hold any more %1.", (localize _itemName)],5,"gray"] call RPG_Fnc_Msg; life_action_in_use = false; };

if(!([true,_item,_count] call life_fnc_handleInv)) exitWith
{
	[format["Gathering failed. You can't hold more %1.", (localize _itemName)],5,"gray"] call RPG_Fnc_Msg;
	life_action_in_use = false;
};

_objects = nearestObjects [player, ["UserTexture_1x2_F"], 2];
if (count _objects < 1) exitWith { [format["Could not reach %1.", (localize _itemName)],5,"gray"] call RPG_Fnc_Msg; life_action_in_use = false; };
//titleText[format["Gathering nearby %1...", (localize _itemName)],"PLAIN"];
player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep 0.5;
_objPos = getPos (_objects select 0);
_clusterParts = nearestObjects [_objPos, ["UserTexture_1x2_F"], 0.1];
{ deleteVehicle _x } forEach _clusterParts;

/*if (_item in ["cannabis","heroin_unprocessed"] && 8 in life_gangtalents) then
{
	if (random 3 < 1) then { _count = _count + 1 };
};*/

player say3D "harvest";
[format["Gathered %1 %2. [%3/%4]",_count,(localize _itemName),life_carryWeight,life_maxWeight],5,"blue"] call RPG_Fnc_Msg;

life_action_in_use = false;