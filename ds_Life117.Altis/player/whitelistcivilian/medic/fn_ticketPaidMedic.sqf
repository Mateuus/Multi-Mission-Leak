/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Medic receiving money for services
*/
hint format ["Because %1 has paid his charge, you have received the value of $%2 in your bank",name (_this select 0),[(_this select 1)] call DS_fnc_numberText];
systemchat format ["Because %1 has paid his charge, you have received the value of $%2 in your bank",name (_this select 0),[(_this select 1)] call DS_fnc_numberText];
[(_this select 1),true,true] spawn DS_fnc_handleMoney;

if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) == 3))then
	{
	_tempNum = DS_infoArray select 24;
	_tempNum = _tempNum + (_this select 1);
	DS_infoArray set [24,_tempNum];
	if((DS_infoArray select 24) > 9999)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((player getVariable ["mechanic",false])&&((DS_infoArray select 23) == 14))then
	{
	_tempNum = DS_infoArray select 24;
	_tempNum = _tempNum + (_this select 1);
	DS_infoArray set [24,_tempNum];
	if((DS_infoArray select 24) > 49999)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if((player getVariable ["medic",false])&&((DS_infoArray select 10) == 6)&&((_this select 1) > 999))then
	{
	[3] call DS_fnc_questCompleted;
	};
	
if((player getVariable ["medic",false])&&((DS_infoArray select 10) == 17)&&((_this select 1) > 19999))then
	{
	[3] call DS_fnc_questCompleted;
	};