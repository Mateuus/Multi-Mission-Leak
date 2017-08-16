/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Rewards rebels for w/e reason
*/
private ["_reward"];
_reward = _this select 0;
if((!DSL_rebel)&&(!DSL_rebelAdv))exitwith{};
player say3D "success";
if((DS_infoArray select 17) > 31)then
	{
	_reward = (round(_reward*1.25));
	};
systemchat format ["You have been awarded with $%1 because %2",[_reward] call DS_fnc_numberText,(_this select 1)];
hint format ["You have been awarded with $%1 because %2",[_reward] call DS_fnc_numberText,(_this select 1)];
[_reward,true,true] call DS_fnc_handleMoney;

if((_this select 2)&&((DS_infoArray select 17) == 31))then
	{
	_tempNum = DS_infoArray select 18;
	_tempNum = _tempNum + 1;
	DS_infoArray set [18,_tempNum];
	if((DS_infoArray select 18) > 3)then
		{
		[2] call DS_fnc_questCompleted;
		};
	};