/*
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

["bones",false,(_payment*_amount)] call DS_fnc_handleInventory;
hint format ["You have been paid $%1 for dropping off %2 human remains",_payment,_amount];
systemChat format ["You have been paid $%1 for dropping off %2 human remains",_payment,_amount];
[(_payment*_amount),true,true] call DS_fnc_handleMoney;
DS_doingStuff = false;

if(((DS_infoArray select 10) == 5)&&(player distance (getMarkerPos "civ_spawn_1") < 5000))then
	{
	_tempNum = DS_infoArray select 11;
	_tempNum = _tempNum + 1;
	DS_infoArray set [11,_tempNum];
	if((DS_infoArray select 11) > 9)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if(((DS_infoArray select 10) == 13)&&(player distance (getMarkerPos "medVeh3") < 5000))then
	{
	_tempNum = DS_infoArray select 11;
	_tempNum = _tempNum + 1;
	DS_infoArray set [11,_tempNum];
	if((DS_infoArray select 11) > 19)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if(((DS_infoArray select 10) == 23)&&(player distance (getMarkerPos "hospital_2") < 5000))then
	{
	_tempNum = DS_infoArray select 11;
	_tempNum = _tempNum + 1;
	DS_infoArray set [11,_tempNum];
	if((DS_infoArray select 11) > 49)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};