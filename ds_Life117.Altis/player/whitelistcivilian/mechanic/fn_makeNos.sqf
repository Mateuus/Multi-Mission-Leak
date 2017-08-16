/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			For mechanics to make repair kits on the move
*/
private ["_tempNum","_price"];

_price = 800;
if((DS_infoArray select 23) > 2)then{_price = _price*0.75};
if((DS_infoArray select 23) > 13)then{_price = 400};
if(DS_doingStuff) exitwith {};
if(vehicle player != player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
if([_price,true] call DS_fnc_checkMoney)exitwith {hint format ["You need atleast $%1 in your bank to make one of these",_price]};
[_price,true,false] call DS_fnc_handleMoney;
DS_doingStuff = true;
hint "Creating Nitro Kit";
systemchat "Creating Nitro Kit";
if((DS_infoArray select 23) < 14)then
	{
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 4;
	};
DS_doingStuff = false;
if(vehicle player != player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
if((DS_infoArray select 23) < 18)then
	{
	["vehNos",true,1] call DS_fnc_handleInventory;
	}
	else
	{
	["vehNosAdv",true,1] call DS_fnc_handleInventory;
	};
hint "You have made your Nitro Kit";
systemchat "You have made your Nitro Kit";
if((DS_infoArray select 23) == 5)then
	{
	_tempNum = DS_infoArray select 24;
	_tempNum = _tempNum + 1;
	DS_infoArray set [24,_tempNum];
		if((DS_infoArray select 24) > 9)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 23) == 13)then
	{
	_tempNum = DS_infoArray select 24;
	_tempNum = _tempNum + 1;
	DS_infoArray set [24,_tempNum];
	if((DS_infoArray select 24) > 9)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};