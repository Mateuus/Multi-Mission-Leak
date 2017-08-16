/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			For medics to make a Medi kit on the fly
*/
private ["_tempNum","_price"];

_price = 200;
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
if(DS_doingStuff) exitwith {};
if((DS_infoArray select 10) > 2)then
	{
	_price = (_price*0.75);
	};
if(vehicle player != player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
if([_price,true] call DS_fnc_checkMoney)exitwith {hint "You need atleast $200 in your bank to make one of these"};
[_price,true,false] call DS_fnc_handleMoney;
DS_doingStuff = true;
hint "Creating Medikit";
systemchat "Creating Medikit";
if((DS_infoArray select 10) < 17)then
	{
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 4;
	};
DS_doingStuff = false;
if(vehicle player != player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
["mediKit",true,1] call DS_fnc_handleInventory;
hint "You have made your Medikit";
systemchat "You have made your Medikit";

if((DS_infoArray select 10) == 2)then
	{
	_tempNum = DS_infoArray select 11;
	_tempNum = _tempNum + 1;
	DS_infoArray set [11,_tempNum];
	if((DS_infoArray select 11) > 9)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if((DS_infoArray select 10) == 16)then
	{
	_tempNum = DS_infoArray select 11;
	_tempNum = _tempNum + 1;
	DS_infoArray set [11,_tempNum];
	if((DS_infoArray select 11) > 19)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};