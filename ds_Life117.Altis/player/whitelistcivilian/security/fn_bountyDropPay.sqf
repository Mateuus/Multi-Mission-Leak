/*
	File: fn_bountyDropPay.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Pays the bounty Hunter
*/
private["_bonus","_hasBounty","_bounty","_name","_location"];

_hasBounty = _this select 0;
_bounty = _this select 1;
_name = _this select 2;
_distance = _this select 3;
_bonus = 1;
if((DS_infoArray select 19) > 12)then{_bonus = 1.2};

if(!_distance)exitwith{hint "This player is not near a Bounty Hunters HQ therefore can not be processed by you";};
if(!_hasBounty)exitwith{hint "This player has no bounty, you must release him";};

player say3D "success";
[(_bounty*_bonus),true,true] spawn DS_fnc_handleMoney;
hint format ["You have been paid $%1 for capturing the criminal %2",(_bounty*_bonus),(name _name)];
systemchat format ["You have been paid $%1 for capturing the criminal %2",(_bounty*_bonus),(name _name)];
[50,true] spawn DS_fnc_moralAlter;
if((DS_infoArray select 19) == 7)then
	{
	[3] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 19) == 12)&&(_bounty > 4999))then
	{
	[3] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 19) == 17)&&(_bounty > 4999))then
	{
	[3] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 19) == 20)&&(_bounty > 49999))then
	{
	[3] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 19) == 37)&&(_bounty > 49999))then
	{
	[3] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 19) == 35)&&(_bounty > 4999))then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 4)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if(((DS_infoArray select 19) == 26)&&(_bounty > 4999))then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 2)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};