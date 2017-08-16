/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Pays a security Guard is defending a recently robbed shop
	*/
private["_payment"];

_level = 50;//Increases with sec level
if((DS_infoArray select 19) > 3)then{_level = 60};
if((DS_infoArray select 19) > 13)then{_level = 75};
if((DS_infoArray select 19) > 19)then{_level = 100};

if(!alive player)exitwith{};
_payment = ((count(playableUnits))*_level);
player say3D "dingDong";
hint format ["You have been paid $%1 for protecting this area during high crime",_payment];
systemChat format ["You have been paid $%1 for protecting this area during high crime",_payment];
[_payment,false,true] call DS_fnc_handleMoney;
if((DS_infoArray select 19) == 8)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 29)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 19) == 16)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 59)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if((DS_infoArray select 19) == 21)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 90)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
	
if((DS_infoArray select 19) == 29)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 119)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 19) == 35)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 44)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};