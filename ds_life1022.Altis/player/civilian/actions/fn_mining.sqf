/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Script for all civilian mining
*/

private ["_cop","_field","_rand","_spareWeight","_itemName","_times"];

if(DS_mining)exitwith{};
_spareWeight = DS_maxWeight - DS_currentWeight;
_times = 2;//Times animation is played
if(DS_item_pickAxe < 1)exitwith{hint "You need a pickaxe to mine here"};
_rand = round random 8;
if(_rand == 0) then {_rand = 8;};
if(DS_moral > 500)then
	{
	if((_rand == 7)||(_rand == 8))then{_rand = 5;};
	};
if((DS_infoArray select 13) > 10)then{_times = 1};

switch (true) do
{
	case (player distance (getMarkerPos "oil") < 50): {_field = "oilu"};
	case (player distance (getMarkerPos "oil2") < 50): {_field = "oilu"};
	case (player distance (getMarkerPos "diamond") < 50): {_field = "diamondu"};
	case (player distance (getMarkerPos "copper") < 50): {_field = "copperu"};
	case (player distance (getMarkerPos "rock") < 50): {_field = "rocku"};
	case (player distance (getMarkerPos "salt") < 50): {_field = "saltu"};
	case (player distance (getMarkerPos "iron") < 50): {_field = "ironu"};
	case (player distance (getMarkerPos "sand") < 50): {_field = "sandu"};
	case (player distance (getMarkerPos "wood") < 50): {_field = "woodu"};
	case (player distance (getMarkerPos "wheat") < 100): {_field = "wheatu"};
	default {_field = "";};
};


_itemName = [_field] call DS_fnc_itemStringConfig;
if(_field isEqualTo "")exitwith{};//Shouldn't happen
if(!isNull objectParent player)exitwith{hint "You can not mine while inside a vehicle"};

if(_spareWeight < 4)exitwith{hint "You do not have enough space to do this"};
DS_mining = true;

for "_i" from 0 to _times do
	{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
	};

[1,true] spawn DS_fnc_moralAlter;

if((_rand == 7)||(_rand == 8)) exitwith
	{
	titleText[format["You didn't find any %1",_itemName],"PLAIN"];
	DS_mining = false;
	};
if((DS_maxWeight - DS_currentWeight) < 4)exitwith{hint "You do not have enough space to do this";DS_mining = false;};
[_field,true,_rand] call DS_fnc_handleInventory;
titleText[format["You have mined %1 %2",_rand,_itemName],"PLAIN"];
DS_mining = false;

if((DS_infoArray select 13) == 10)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 49)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};