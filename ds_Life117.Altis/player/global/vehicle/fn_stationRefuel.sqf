/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Refuels at gas station
*/
private ["_totalCost","_air","_station"];

_totalCost = 0;
_fuel = fuel (vehicle player);
_fuelstartposition = getpos(vehicle player);
_exitvar = 0;
if(DS_doingStuff)exitwith{};
if((vehicle player) isKindOf "Air")then{_air = 10}else{_air = 1};

switch (true) do
	{
	case (player distance gasdesk1 < 100) : {_station = gasdesk1};
	case (player distance gasdesk2 < 100) : {_station = gasdesk2};
	case (player distance gasdesk3 < 100) : {_station = gasdesk3};
	case (player distance gasdesk4 < 100) : {_station = gasdesk4};
	case (player distance gasdesk5 < 100) : {_station = gasdesk5};
	case (player distance gasdesk6 < 100) : {_station = gasdesk6};
	case (player distance gasdesk7 < 100) : {_station = gasdesk7};
	case (player distance gasdesk8 < 100) : {_station = gasdesk8};
	case (player distance gasdesk9 < 100) : {_station = gasdesk9};
	case (player distance gasdesk10 < 100) : {_station = gasdesk10};
	case (player distance gasdesk1_1 < 100) : {_station = gasdesk1_1};
	default {_station = shawn1};
	};

if((_station != shawn1)&&((vehicle player) isKindOf "Air"))exitwith{hint "Air vehicles can not refuel at normal gas stations"};
if(_station getVariable ["closed",false])then{[] call DS_fnc_closedShopCheck;};
	
if(_station getVariable ["closed",false])exitWith
	{
	DS_doingStuff = false;
	hint "You can not currently refuel here because this Gas Station is closed, come back soon";
	systemchat "You can not currently refuel here because this Gas Station is closed, come back soon";
	};
	
DS_doingStuff = true;

if (vehicle player == player) exitwith
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You must be in a vehicle to refuel it<br/></t>";
	hint _str;
	DS_doingStuff = false;
	};

if (_fuel >= 0.99) exitWith 
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>Your vehicle is already full<br/></t>";
	hint _str;
	DS_doingStuff = false;
	};

while {((fuel (vehicle player)) < 0.99)} do 
	{
	_tankvehicle = vehicle player;	
	_cost = ((gasMoneyArray select 11)*_air);
	if((DS_infoArray select 13) > 30)then{_cost = (_cost*0.5);};

	if ([_cost,true] call DS_fnc_checkMoney) exitWith 
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You don't have enough money in your bank to fully refuel your vehicle<br/></t>";
		hint _str;
		_exitvar = 1;
		};

	if (_tankvehicle == player) exitWith 
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You must remain in your vehicle to refuel it<br/></t>";
		hint _str;
		_exitvar = 1;
		};

	if (vehicle player distance _fuelstartposition > 15) exitWith 
		{
		_str = parseText "<t color='#FF0000' size='1.5'><br/>Your refueling was cancelled because you moved your vehicle!<br/></t>";
		hint _str;
		_exitvar = 1;
		};

	_tankvehicle setFuel ((fuel _tankvehicle)+0.1);
	titleText["...Refueling...","PLAIN"];
	if(DS_moral < 400)then
		{
		_cost = (((gasMoneyArray select 11)*2)*_air);
		}
		else
		{
		_cost = ((gasMoneyArray select 11)*_air);
		};
	[_cost,true,false] call DS_fnc_handleMoney;
	_totalCost = _totalCost + _cost;
	sleep 3;

	};

if (_exitvar == 1) exitWith {DS_doingStuff = false;if(DS_coin < 0)then{DS_coin = 0};};
titleText["...Vehicle Fully Refueled...","PLAIN"];
		_str = parseText "<t color='#FF0000' size='1.5'><br/>Vehicle Fully Refueled<br/></t>";
		hint _str;
DS_doingStuff = false;
//[_totalCost,true] spawn DS_fnc_serverPayment;

if(DS_coin < 0)then{DS_coin = 0};
