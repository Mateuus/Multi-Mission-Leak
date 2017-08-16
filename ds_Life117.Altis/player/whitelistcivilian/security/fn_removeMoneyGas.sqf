/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Removes funds from gas stations as security guard
*/
private ["_robbed","_station","_copsNeeded","_action","_stationMoney","_MINTAKE","_bonus","_playerPos","_amountToSteal","_amountToStealBonus","_firstLoop","_totalStolen","_busted"];

_MINTAKE = 300;
_playerPos = (position player);
_amountToSteal = 0;
_amountToStealBonus = 0;
_firstLoop = true;
_totalStolen = 0;
_robbed = false;
_busted = 0;
_payout = 2;//Changes by security level
if((DS_infoArray select 19) > 22)then{_payout = 3;};

if(DS_doingStuff)exitwith{};

switch (true) do
	{
	case (player distance gasdesk1 < 50) : {_station = [1,"Kore",gasdesk1]};
	case (player distance gasdesk2 < 50) : {_station = [2,"Lakka",gasdesk2]};
	case (player distance gasdesk3 < 50) : {_station = [3,"Zaros",gasdesk3]};
	case (player distance gasdesk4 < 50) : {_station = [4,"Neochori",gasdesk4]};
	case (player distance gasdesk5 < 50) : {_station = [5,"Athira",gasdesk5]};
	case (player distance gasdesk6 < 50) : {_station = [6,"Gravia",gasdesk6]};
	case (player distance gasdesk7 < 50) : {_station = [7,"Pyrgos",gasdesk7]};
	case (player distance gasdesk8 < 50) : {_station = [8,"Chalkia",gasdesk8]};
	case (player distance gasdesk9 < 50) : {_station = [9,"Paros",gasdesk9]};
	case (player distance gasdesk10 < 50) : {_station = [10,"Sofia",gasdesk10]};
	};

if([getPos player,15,independent] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};

_action = [
		"Removing money from this station makes you K.O.S to possible robbers, Continue??",
		"Remove money",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

_stationMoney = (gasMoneyArray select (_station select 0));
if(_stationMoney < _MINTAKE)exitwith{hint "There is not enough money here to remove"};

DS_doingStuff = true;

_str = parseText "<t color='#01DF01' size='1.5'><br/>Remain close to the attendant to remove money<br/></t>";
hint _str;
systemchat "Remain close to the attendant to remove money";

sleep 5;

while{((player distance _playerPos < 6)&&(_stationMoney > _MINTAKE))}do
		{
		_amountToSteal = round random _stationMoney;
		_stationMoney = _stationMoney - _amountToSteal;

		[(_amountToSteal*_payout),false,true] call DS_fnc_handleMoney;
		_robbed = true;
		
		if(_firstLoop) then
			{
			[[0,format["A security Guard is removing funds from the %1 Gas Station.",(_station select 1)]],"DS_fnc_globalMessage",true,false] spawn DS_fnc_MP;
			[[1,format["A security Guard is removing funds from the %1 Gas Station.",(_station select 1)]],"DS_fnc_globalMessage",true,false] spawn DS_fnc_MP;
			_firstLoop = false;
			};
		sleep 1;
		_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, stay close to take more<br/></t>",(round(_amountToSteal*_payout))];
		hint _str;
		systemchat format ["You have taken $%1, stay close to take more",(round(_amountToSteal*_payout))];
		sleep 10;
		if((DS_infoArray select 19) == 0)then
			{
			_tempNum = DS_infoArray select 20;
			_tempNum = _tempNum + _amountToSteal;
			DS_infoArray set [20,_tempNum];
			if((DS_infoArray select 20) > 9999)then
				{
				[3] call DS_fnc_questCompleted;
				};
			};
		if((DS_infoArray select 19) == 9)then
			{
			_tempNum = DS_infoArray select 20;
			_tempNum = _tempNum + _amountToSteal;
			DS_infoArray set [20,_tempNum];
			if((DS_infoArray select 20) > 29999)then
				{
				[3] call DS_fnc_questCompleted;
				};
			};
		if((DS_infoArray select 19) == 22)then
			{
			_tempNum = DS_infoArray select 20;
			_tempNum = _tempNum + _amountToSteal;
			DS_infoArray set [20,_tempNum];
			if((DS_infoArray select 20) > 99999)then
				{
				[3] call DS_fnc_questCompleted;
				};
			};
		};

gasMoneyArray set[(_station select 0),_stationMoney];
publicVariable "gasMoneyArray";
DS_doingStuff = false;

if(_stationMoney <= _MINTAKE) then
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You have taken all the funds from this station<br/></t>";
	hint _str;
	systemchat "You have taken all the funds from this station";
	}
	else
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You moved too far away from the attendant<br/></t>";
	hint _str;
	systemchat "You moved too far away from the attendant";	
	};
	
