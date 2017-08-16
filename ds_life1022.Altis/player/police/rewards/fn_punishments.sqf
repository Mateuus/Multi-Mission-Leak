/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Punishes police for stuff
*/

private ["_amount"];

if(isNil "DS_infoArray")exitwith{};//Make sure the player has loaded in properly
if((DS_infoArray select 0) < 300)exitwith{};//No punishment because hasn't played atleast 5 hours
//Pub cop and pubs locked?
if((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"])&&(miscInfoArray select 7))exitwith{};

_DS_punishByRank =
	{
	_incomingAmount = _this select 0;
	_incomingMax = _this select 1;
	_done = false;
	_return = 0;
	if((DS_atmCoin > 50000000)&&(!_done))then
		{
		_return = _incomingAmount*20;
		_done = true;
		};
	if((DS_atmCoin > 40000000)&&(!_done))then
		{
		_return = _incomingAmount*16;
		_done = true;
		};
	if((DS_atmCoin > 30000000)&&(!_done))then
		{
		_return = _incomingAmount*13;
		_done = true;
		};
	if((DS_atmCoin > 25000000)&&(!_done))then
		{
		_return = _incomingAmount*10;
		_done = true;
		};
	if((DS_atmCoin > 20000000)&&(!_done))then
		{
		_return = _incomingAmount*7;
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


if(((_this select 1) == "You failed to protect a hostage")&&(DS_copLevel == 0))exitwith{};//Don't punish pubbies

if((_this select 1) == "The police failed to protect the Island from Terrorist")exitWith
	{
	_amount = [50000,200000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The MCU was destroyed")exitWith
	{
	_amount = [50000,250000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "A safe at Fort Knox is unlocked")exitWith
	{
	_amount = [35000,150000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

	if((_this select 1) == "The safe at the Research Facility is unlocked")exitWith
	{
	_amount = [35000,150000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The doors at the bank have been left open")exitWith
	{
	_amount = [35000,150000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The power station is in rebel hands")exitWith
	{
	_amount = [35000,150000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The front gate at the jail has been left open")exitWith
	{
	_amount = [35000,150000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "A rebel holds a police checkpoint")exitWith
	{
	_amount = [50000,100000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The MCU was chopped")exitWith
	{
	_amount = [30000,300000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

if((_this select 1) == "The police allowed the spy documents to be stolen by a rebel")exitWith
	{
	_time = (DS_infoArray select 0);
	_amount = [70000,125000] call _DS_punishByRank;
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[(_this select 0),true,false] call DS_fnc_handleMoney;
	[] call DS_fnc_compileData;
	};

hint format ["$%1 has been deducted from your bank because %2",[(_this select 0)] call DS_fnc_numberText,(_this select 1)];
systemchat format ["$%1 has been deducted from your bank because %2",[(_this select 0)] call DS_fnc_numberText,(_this select 1)];
player say3D "fail";
[(_this select 0),true,false] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;