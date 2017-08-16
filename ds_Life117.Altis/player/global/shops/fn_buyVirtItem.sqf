/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a Virtual Item
*/
disableSerialization;

private["_exit","_value","_weight","_index","_buyMulti","_strName","_price","_station"];
ctrlShow[66654,false];
ctrlShow[66654,false];
ctrlShow[778,false];
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
_buyMulti = _this select 0;
_exit = false;
if(_buyMulti)then
	{
	_value = 5
	}
	else
	{
	_value = 1
	};
	
switch (true) do
	{
	case (player distance gasdesk1 < 50) : {_station = gasdesk1};
	case (player distance gasdesk2 < 50) : {_station = gasdesk2};
	case (player distance gasdesk3 < 50) : {_station = gasdesk3};
	case (player distance gasdesk4 < 50) : {_station = gasdesk4};
	case (player distance gasdesk5 < 50) : {_station = gasdesk5};
	case (player distance gasdesk6 < 50) : {_station = gasdesk6};
	case (player distance gasdesk7 < 50) : {_station = gasdesk7};
	case (player distance gasdesk8 < 50) : {_station = gasdesk8};
	case (player distance gasdesk9 < 50) : {_station = gasdesk9};
	case (player distance gasdesk10 < 50) : {_station = gasdesk10};
	case (player distance hosp1 < 50) : {_station = hosp1};
	case (player distance hosp2 < 50) : {_station = hosp2};
	default {_station = shawn1};
	};	

if(DS_className in ["bpBlackfoot","bpWeaponsLand","bpWeaponsAir","bpThermal","bpVehSUV"])then
	{
	_action = [
		"The item you are buying requires that you have completed certain quest to use. Check the quest lines to ensure you can use this item before buying it",
		"Quest Item",
		"Continue",
		"Exit"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true};
	};
if(_exit)exitwith{DS_doingStuff = false;};
	
if(_station getVariable ["closed",false])then{[] call DS_fnc_closedShopCheck;};
	
if(_station getVariable ["closed",false])exitWith
	{
	DS_doingStuff = false;
	hint "This store is currently closed because of recent robberies, please check back soon";
	systemchat "This store is currently closed because of recent robberies, please check back soon";
	};

if((DS_className == "cracker")&&(player distance reb_1_1_1 > 100))exitWith
	{
	hint "You can only buy this item at the Rebel KOS shop";
	closeDialog 0;
	DS_doingStuff = false;
	};
	
_index = [DS_className] call DS_fnc_itemIndex;
_strName = [DS_className] call DS_fnc_itemStringConfig;
_weight = [DS_className,_value] call DS_fnc_itemWeight;
if((_weight + DS_currentWeight) > DS_maxWeight)exitwith
	{
	hint "You do not have enough space to buy and carry this amount";
	closeDialog 0;
	DS_doingStuff = false;
	};

_price = (DS_price*_value);
if([_price,false] call DS_fnc_checkMoney)exitwith{DS_doingStuff = false;};//Happens when you try to buy too fast
[DS_className,true,_value] call DS_fnc_handleInventory;
[_price,false,false] call DS_fnc_handleMoney;
if(_value > 1)then
	{
	hint format ["You have bought %1 %2s for $%3",_value,_strName,_price];
	}
	else
	{
	hint format ["You have bought A %1 for $%2",_strName,_price];
	};
DS_doingStuff = false;
ctrlShow[66654,true];
ctrlShow[778,true];

