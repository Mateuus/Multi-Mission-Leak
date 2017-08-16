/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Script for all civilian relic mining
*/

private ["_tempNum","_cop","_field","_rand","_spareWeight","_itemName"];

if(DS_mining)exitwith{};
_spareWeight = DS_maxWeight - DS_currentWeight;
if(!(surfaceisWater (getPos vehicle player)))exitwith{hint "You must be in the water to collect these"};
_rand = round random 8;
_sleep = 5;
if(_rand == 0) then {_rand = 8;};
if(DS_moral > 500)then
	{
	if((_rand == 7)||(_rand == 8))then{_rand = 5;};
	};

if((getPos player select 2) > -10)exitwith{hint "You must dive deeper to find relics"};

switch (true) do
{
	case (player distance (getMarkerPos "relic1") < 50): {_field = "relic"};
	case (player distance (getMarkerPos "relic2") < 50): {_field = "relic"};
	case (player distance (getMarkerPos "relic3") < 50): {_field = "relic"};
	case (player distance (getMarkerPos "relic4") < 50): {_field = "illegalRelicu"};
	case (player distance (getMarkerPos "relic5") < 50): {_field = "illegalRelicu"};
	case (player distance (getMarkerPos "relic6") < 50): {_field = "illegalRelicu"};
	default {_field = "";};
};

if((_field isEqualTo "relic")&&((DS_infoArray select 13) > 27))then { _sleep = 2.5 };
_itemName = [_field] call DS_fnc_itemStringConfig;
if(_field isEqualTo "")exitwith{};//Shouldn't happen
if(!isNull objectParent player)exitwith{hint "You can not mine while inside a vehicle"};

if(_spareWeight < 4)exitwith{hint "You do not have enough space to do this"};
DS_mining = true;
if(!(surfaceisWater (getPos vehicle player)))exitwith{hint "You must be in the water to collect these"};
titleText["Searching for relics...","PLAIN"];
sleep _sleep;
if(_field == "relic")then
	{
	[1,true] spawn DS_fnc_moralAlter;
	}
	else
	{
	[1,false] spawn DS_fnc_moralAlter;
	};

if((DS_maxWeight - DS_currentWeight) < 4)exitwith{hint "You do not have enough space to do this";DS_mining = false;};
[_field,true,_rand] call DS_fnc_handleInventory;
titleText[format["You have found %1 %2",_rand,_itemName],"PLAIN"];
DS_mining = false;

if((_field isEqualTo "relic")&&((DS_infoArray select 13) == 27))then {
	_tempNum = (DS_infoArray select 14) + _rand;
	if(_tempNum > 299)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};

if((_field isEqualTo "illegalRelicu")&&((DS_infoArray select 15) == 12))then { [1] call DS_fnc_questCompleted };