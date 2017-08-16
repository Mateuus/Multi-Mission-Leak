/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Rewards police when they do something decent
*/

private ["_exit"];
_exit = false;

if(isNil "DS_infoArray")exitwith{};//Make sure the player has loaded in properly

_DS_rewardByRank =
	{
	_incomingAmount = _this select 0;
	_incomingMax = _this select 1;
	_done = false;
	_return = 0;
	if((DS_atmCoin > 50000000)&&(!_done))then
		{
		_return = _incomingAmount*10;
		_done = true;
		};
	if((DS_atmCoin > 40000000)&&(!_done))then
		{
		_return = _incomingAmount*8;
		_done = true;
		};
	if((DS_atmCoin > 30000000)&&(!_done))then
		{
		_return = _incomingAmount*7;
		_done = true;
		};
	if((DS_atmCoin > 25000000)&&(!_done))then
		{
		_return = _incomingAmount*6;
		_done = true;
		};
	if((DS_atmCoin > 20000000)&&(!_done))then
		{
		_return = _incomingAmount*5;
		_done = true;
		};
	if((DS_atmCoin > 15000000)&&(!_done))then
		{
		_return = _incomingAmount*4;
		_done = true;
		};
	if((DS_atmCoin > 10000000)&&(!_done))then
		{
		_return = _incomingAmount*2;
		_done = true;
		};
	if(_return == 0)then
		{
		_return = (_this select 0);
		};
	if(_return > (_this select 1))then
		{
		_return = (_this select 1);
		};
	_return;
	};

if((_this select 0) == 666)exitwith
	{
	if((DS_infoArray select 21) == 20)then { [3] call DS_fnc_questCompleted };
	if((DS_infoArray select 21) == 30)then { [3] call DS_fnc_questCompleted };
	if((DS_infoArray select 21) > 20)then
		{
		if((DS_infoArray select 21) > 30)then
			{
			hint format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*10000)] call DS_fnc_numberText];
			systemchat format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*10000)] call DS_fnc_numberText];
			player say3D "success";
			[((count(allPlayers))*10000),true,true] call DS_fnc_handleMoney;
			}
			else
			{
			hint format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*7500)] call DS_fnc_numberText];
			systemchat format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*7500)] call DS_fnc_numberText];
			player say3D "success";
			[((count(allPlayers))*7500),true,true] call DS_fnc_handleMoney;
			};
		}
		else
		{
		hint format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*5000)] call DS_fnc_numberText];
		systemchat format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(allPlayers))*5000)] call DS_fnc_numberText];
		player say3D "success";
		[((count(allPlayers))*5000),true,true] call DS_fnc_handleMoney;
		};
	};

if((_this select 1) == "has collected the spy documents")exitWith
	{
	//_reward = [12000,200000] call _DS_rewardByRank;
	_reward = [5000,50000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if((_this select 1) == "Defused C4")exitWith
	{
	//_reward = [15000,150000] call _DS_rewardByRank;
	_reward = [7500,75000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if((_this select 1) == "A terrorist failed to complete their mission")exitWith
	{
	//_reward = [50000,300000] call _DS_rewardByRank;
	_reward = [25000,100000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if((_this select 1) == "has been killed while doing a terrorism mission")exitWith
	{
	//_reward = [65000,350000] call _DS_rewardByRank;
	_reward = [40000,120000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if(((_this select 1) == "Repaired the bank door")||((_this select 1) == "Repaired the jail gate")||((_this select 1) == "Repaired the power station"))exitWith
	{
	//_reward = [12000,130000] call _DS_rewardByRank;
	_reward = [6000,40000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %2 %3",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if((_this select 1) == "has been restrained while doing a terrorism mission")exitWith
	{
	//_reward = [75000,470000] call _DS_rewardByRank;
	_reward = [50000,150000] call _DS_rewardByRank;
	hint format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %3 %2",[_reward] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[_reward,true,true] call DS_fnc_handleMoney;
	};

if((_this select 1) == "Have defended a checkpoint")then {
	_exit = true;
	if((player getVariable ["policeSquad",""]) == "Highway Patrol")then {
		hint format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
		systemchat format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
		player say3D "success";
		[((_this select 0)*2),true,true] call DS_fnc_handleMoney;
		if((DS_infoArray select 21) == 3)then {
			_tempNum = (DS_infoArray select 22) + 1;
			if(_tempNum > 1)then {
				[3] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [22,_tempNum];
			};
		};
	} else {
		hint format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
		systemchat format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
		player say3D "success";
		[((_this select 0)*2),true,true] call DS_fnc_handleMoney;
		if((DS_infoArray select 21) == 3)then {
			_tempNum = (DS_infoArray select 22) + 1;
			if(_tempNum > 1)then {
				[3] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [22,_tempNum];
			};
		};
	};
};

if(_exit)exitwith{};

hint format ["You have been paid a reward of $%1 because %2 %3",[(_this select 0)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
systemchat format ["You have been paid a reward of $%1 because %2 %3",[(_this select 0)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
player say3D "success";
[(_this select 0),true,true] call DS_fnc_handleMoney;