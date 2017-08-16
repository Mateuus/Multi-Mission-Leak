/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Removes funds from Hospital as security contractor
*/

private ["_robbed","_station","_copsNeeded","_stationMoney","_MINTAKE","_bonus","_playerPos","_amountToSteal","_amountToStealBonus","_firstLoop","_totalStolen","_busted","_targets"];

_MINTAKE = 300;
_playerPos = (position player);
_amountToSteal = 0;
_amountToStealBonus = 0;
_firstLoop = true;
_totalStolen = 0;
_robbed = false;
_busted = 0;
_payout = 2;//Changes by security level
if((DS_infoArray select 19) > 10)then{_payout = 2.5};

if(DS_doingStuff)exitwith{};

switch (true) do
	{
	case (player distance hosp1 < 50) : {_station = [12,"Sofia",hosp1,"DS_item_sodiumPack"]};
	case (player distance hosp2 < 50) : {_station = [13,"Telos",hosp2,"DS_item_hydroPack"]};
	};

if([player,15,independent] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when another player is so nearby","PLAIN"];};

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
			_targets = allPlayers select {(_x distance player) < 6000};
			[0,format["A security contractor is removing funds from the %1 Hospital.",(_station select 1)],false,0] remoteExecCall ["DS_fnc_globalMessage",_targets];
			_firstLoop = false;
			};
		sleep 1;
		_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, stay close to take more<br/></t>",(round(_amountToSteal*_payout))];
		hint _str;
		systemchat format ["You have taken $%1, stay close to take more",(round(_amountToSteal*_payout))];
		sleep 10;
		if((DS_infoArray select 19) == 1)then {
			_tempNum = (DS_infoArray select 20) + _amountToSteal;
			if(_tempNum > 99999)then {
				[3] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [20,_tempNum];
			};
		};

		if((DS_infoArray select 19) == 10)then {
			_tempNum = (DS_infoArray select 20) + _amountToSteal;
			if(_tempNum > 199999)then {
				[3] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [20,_tempNum];
			};
		};

		if((DS_infoArray select 19) == 33)then {
			_tempNum = (DS_infoArray select 20) + _amountToSteal;
			if(_tempNum > 299999)then {
				[3] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [20,_tempNum];
			};
		};
		};

gasMoneyArray set[(_station select 0),_stationMoney];
publicVariable "gasMoneyArray";
DS_doingStuff = false;

if(_stationMoney <= _MINTAKE) then
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You have taken all the funds from this hospital<br/></t>";
	hint _str;
	systemchat "You have taken all the funds from this hospital";
	}
	else
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You moved too far away from the attendant<br/></t>";
	hint _str;
	systemchat "You moved too far away from the attendant";
	};