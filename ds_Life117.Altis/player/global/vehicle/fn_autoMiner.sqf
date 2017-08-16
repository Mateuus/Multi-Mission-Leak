/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs the auto mining feature on the tempest device
*/

private ["_vehCurWeight","_difference","_value","_index","_field","_pos","_sleep","_random","_boot","_bonus"];
_vehicle = cursorTarget;
if(typeOf _vehicle != "O_Truck_03_device_F")exitwith{};
if(DS_doingStuff)exitwith{hint "Please wait 10 seconds before doing this"};
DS_doingStuff = true;
if(_vehicle getVariable ["autoMining",false])exitwith
	{
	hintSilent "Auto Miner Stopped";
	_vehicle EngineOn false;
	_vehicle setVariable ["autoMining",false,true];
	sleep 5;
	DS_doingStuff = false;
	};
DS_doingStuff = false;
_pos = (position _vehicle);
_sleep = 35;
if(DS_moral < 750)then{_sleep = 15;};
_index = -1;
_value = 0;
_difference = 10;
_newWeight = 0;
_vehMaxWeight = [(typeOf _vehicle)] call DS_fnc_getVehWeight;
switch(true)do
	{
	case (_vehicle getVariable ["extraspace1",false]):{_bonus = 1.2};
	case (_vehicle getVariable ["extraspace2",false]):{_bonus = 1.4};
	case (_vehicle getVariable ["extraspace3",false]):{_bonus = 1.6};
	case (_vehicle getVariable ["extraspace4",false]):{_bonus = 1.8};
	case (_vehicle getVariable ["extraspace5",false]):{_bonus = 2};
	default {_bonus = 1};
	};
if(_vehicle getVariable ["extraspace",false])then
	{
	_bonus = _bonus + 0.5;
	};
if(_vehicle getVariable ["extraspaceAdv",false])then
	{
	_bonus = _bonus + 1;
	};
_vehMaxWeight = (_vehMaxWeight*_bonus);
switch (true) do
{
	case (_vehicle distance (getMarkerPos "oil") < 50): {_field = "oilu"};
	case (_vehicle distance (getMarkerPos "oil2") < 50): {_field = "oilu"};
	case (_vehicle distance (getMarkerPos "diamond") < 50): {_field = "diamondu"};
	case (_vehicle distance (getMarkerPos "copper") < 50): {_field = "copperu"};
	case (_vehicle distance (getMarkerPos "rock") < 50): {_field = "rocku"};
	case (_vehicle distance (getMarkerPos "salt") < 50): {_field = "saltu"};
	case (_vehicle distance (getMarkerPos "iron") < 50): {_field = "ironu"};
	case (_vehicle distance (getMarkerPos "sand") < 50): {_field = "sandu"};
	case (_vehicle distance (getMarkerPos "wood") < 50): {_field = "woodu"};
	default {_field = "";};
};

if(_field == "")exitwith{hint "You are not near enough to any mining field"};
if(fuel _vehicle < 0.01)exitwith{hint "There is not enough fuel in this vehicle to operate the auto miner"};
_vehicle setVariable ["autoMining",true,true];
_vehicle engineOn true;
if((DS_infoArray select 13) == 22)then
		{
		[0] call DS_fnc_questCompleted;
		};
while{(_vehicle getVariable ["autoMining",false])}do
	{
	_boot = _vehicle getVariable ["boot",[[],0]];
	_bootItems = _boot select 0;
	_vehCurWeight = _boot select 1;
	//systemchat format ["Items = %1 || Weight = %2",_bootItems,_vehCurWeight];
	if(!(isEngineOn _vehicle))exitwith{};
	if((_vehMaxWeight - _vehCurWeight) < 4)exitwith{};
	if(!alive _vehicle)exitwith{};
	if(_vehicle distance _pos > 10)exitwith{};
	if(fuel _vehicle < 0.01)exitwith{};
	titleText ["Auto Miner is mining","PLAIN"];
	hintSilent "Auto Miner is mining";
	if((_vehMaxWeight - _vehCurWeight) < 100)then
		{
		_random = 5 + (round random 5);
		_sleep = 7;
		}
		else
		{
		_random = 10 + (round random 10);
		};
	sleep _sleep;
	if(!(_vehicle getVariable ["autoMining",false]))exitwith{};
	if((_vehMaxWeight - _vehCurWeight) >= (_random*4))then
		{
			{
			if((_x select 0) == _field)then
				{
				_index = _forEachIndex;
				};
			}forEach _bootItems;
			if(_index == -1)then	
				{
				_bootItems pushBack [_field,_random];
				_newWeight = ((_random*4) + (_vehCurWeight));
				}
				else
				{
				_value = (_bootItems select _index) select 1;
				_value = _value + _random;
				_newWeight = ((_random*4) + (_vehCurWeight));
				_bootItems set[_index,[_field,_value]];
				};
		}
		else
		{
		_difference = (_vehMaxWeight - _vehCurWeight);
		//systemchat format ["Difference = %1",_difference];
		if(_difference < 4)exitwith{};
		_difference = 1;
			{
			if((_x select 0) == _field)then
				{
				_index = _forEachIndex;
				};
			}forEach _bootItems;
			if(_index == -1)then	
				{
				_random = _difference;
				_bootItems pushBack [_field,_difference];
				_newWeight = ((_difference*4) + (_vehCurWeight));
				}
				else
				{
				_random = _difference;
				_value = (_bootItems select _index) select 1;
				_value = _value + (_difference);
				_newWeight = ((_difference*4) + (_vehCurWeight));
				_bootItems set[_index,[_field,_value]];
				};
		if(_difference < 1)exitwith{};
		};
	if(_difference < 1)exitwith{};
	_vehicle setVariable["boot",[_bootItems,_newWeight],true];
	titleText[format["Your Auto Miner has mined %1 %2",_random,[_field] call DS_fnc_itemStringConfig],"PLAIN"];
	hintSilent format ["Your Auto Miner has mined %1 %2",_random,[_field] call DS_fnc_itemStringConfig];
	if(_vehicle getVariable ["fuel",false])then
		{
		_vehicle setfuel ((fuel _vehicle) - 0.02);
		}
		else
		{
		if(_vehicle getVariable ["fuel",false])then
			{
			_vehicle setfuel ((fuel _vehicle) - 0.005);
			}
			else
			{
			_vehicle setfuel ((fuel _vehicle) - 0.05);
			};
		};
	sleep 5;
	};
if(!(_vehicle getVariable ["autoMining",false]))exitwith{};
_vehicle setVariable ["autoMining",false,true];
if(_difference < 1)exitwith{hintSilent "There is no room remaining in this vehicle";_vehicle engineOn false;};
if((_vehMaxWeight - _vehCurWeight) < 4)exitwith{hintSilent "You Auto Miner has no more space left to collect resources";_vehicle engineOn false;};
if(!alive _vehicle)exitwith{};
if(_vehicle distance _pos > 10)exitwith{hintSilent "Mining cancelled because your Auto Miner has moved";_vehicle engineOn false;};
if(fuel _vehicle < 0.01)exitwith{hintSilent "You Auto Miner has ran of petrol, It will not mine until it is refuelled"};
if(!(isEngineOn _vehicle))exitwith{hintSilent "The Auto Miners engine must be left on to remain operational"};

	














