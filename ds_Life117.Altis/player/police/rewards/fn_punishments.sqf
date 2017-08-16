/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Punishes police for stuff
*/

private ["_amount"];

if((_this select 1) == "The police failed to protect the Island from Terrorist")exitWith
	{
	_amount = 0;
	if(player getVariable["pubCop",false])then
		{
		_amount = 5000;
		}
		else
		{
		if(DS_atmCoin < 200000)then
			{
			_amount = 20000;
			}
			else
			{
			if(DS_atmCoin < 500000)then
				{
				_amount = 50000;
				}
				else
				{
				if(DS_atmCoin < 2000000)then
					{
					_amount = 65000;
					}
					else
					{
					_amount = 80000;
					};
				};
			};
		};
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney	
	};
	
if((_this select 1) == "The MCU was destroyed")exitWith
	{
	_amount = 0;
	if(player getVariable["pubCop",false])then
		{
		_amount = 5000;
		}
		else
		{
		if(DS_atmCoin < 200000)then
			{
			_amount = 20000;
			}
			else
			{
			if(DS_atmCoin < 500000)then
				{
				_amount = 50000;
				}
				else
				{
				if(DS_atmCoin < 2000000)then
					{
					_amount = 80000;
					}
					else
					{
					_amount = 120000;
					};
				};
			};
		};
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney	
	};
	
if((_this select 1) == "The MCU was chopped")exitWith
	{
	_amount = 0;
	if(player getVariable["pubCop",false])then
		{
		_amount = 5000;
		}
		else
		{
		if(DS_atmCoin < 200000)then
			{
			_amount = 30000;
			}
			else
			{
			if(DS_atmCoin < 500000)then
				{
				_amount = 70000;
				}
				else
				{
				if(DS_atmCoin < 2000000)then
					{
					_amount = 110000;
					}
					else
					{
					_amount = 170000;
					};
				};
			};
		};
	hint format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	systemchat format ["$%1 has been deducted from your bank because %2",[_amount] call DS_fnc_numberText,(_this select 1)];
	player say3D "fail";
	[_amount,true,false] call DS_fnc_handleMoney;
	};

hint format ["$%1 has been deducted from your bank because %2",[(_this select 0)] call DS_fnc_numberText,(_this select 1)];
systemchat format ["$%1 has been deducted from your bank because %2",[(_this select 0)] call DS_fnc_numberText,(_this select 1)];
player say3D "fail";
[(_this select 0),true,false] call DS_fnc_handleMoney;
[] call DS_fnc_compileData;
