/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Delivers collected bones
*/

private["_amount","_payment"];

if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};

_payment = 15000;
if((DS_infoArray select 10) > 5)then
	{
	_payment = (_payment*1.25);
	};
if((DS_infoArray select 10) > 28)then
	{
	_payment = (_payment*2);
	};
_amount = DS_item_bones;
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
hint "Checking your inventory for human remains...";
sleep 3;
if(_amount < 1)exitWith
	{
	DS_doingStuff = false;
	hint "You have no human remains to deliver";
	};

// Quest payment checks?

["bones",false,_amount] call DS_fnc_handleInventory;
hint format ["You have been paid $%1 for dropping off %2 human remains",(_payment*_amount),_amount];
systemChat format ["You have been paid $%1 for dropping off %2 human remains",(_payment*_amount),_amount];
[(_payment*_amount),true,true] call DS_fnc_handleMoney;
DS_doingStuff = false;

if((player distance hosp1_2 < 200)&&((DS_infoArray select 10) == 5))then {
	_tempNum = (DS_infoArray select 11) + _amount;
	if(_tempNum > 19)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance hosp2 < 200)&&((DS_infoArray select 10) == 13))then {
	_tempNum = (DS_infoArray select 11) + _amount;
	if(_tempNum > 19)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance hosp1 < 200)&&((DS_infoArray select 10) == 23))then {
	_tempNum = (DS_infoArray select 11) + _amount;
	if(_tempNum > 49)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};