/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Refuels at gas station
*/

private ["_totalCost","_pos","_exit","_air","_station","_str","_vehicle","_cost","_newFuel"];

if(DS_doingStuff)exitWith{};

_totalCost = 0;
_pos = getPos (vehicle player);
_exit = false;
_air = if((vehicle player) isKindOf "Air")then{25}else{1};
_station = switch(true)do {
	case (player distance gasdesk1 < 100): {gasdesk1};
	case (player distance gasdesk2 < 100): {gasdesk2};
	case (player distance gasdesk3 < 100): {gasdesk3};
	case (player distance gasdesk4 < 100): {gasdesk4};
	case (player distance gasdesk5 < 100): {gasdesk5};
	case (player distance gasdesk6 < 100): {gasdesk6};
	case (player distance gasdesk7 < 100): {gasdesk7};
	case (player distance gasdesk8 < 100): {gasdesk8};
	case (player distance gasdesk9 < 100): {gasdesk9};
	case (player distance gasdesk10 < 100): {gasdesk10};
	case (player distance gasdesk1_1 < 100): {gasdesk1_1};
	default {shawn1};
};

if((!(_station isEqualTo shawn1))&&((vehicle player) isKindOf "Air"))exitWith{hint "Air vehicles can not refuel at normal gas stations"};
if(_station getVariable ["closed",false])then{[] call DS_fnc_closedShopCheck;};

if(_station getVariable ["closed",false])exitWith {
	hint "You can not currently refuel here because this Gas Station is closed, come back soon";
	systemChat "You can not currently refuel here because this Gas Station is closed, come back soon";
};

if(isNull objectParent player)exitwith {
	_str = parseText "<t color='#FF0000' size='1.5'><br/>You must be in a vehicle to refuel it<br/></t>";
	hint _str;
};

if((fuel (vehicle player)) >= 0.99)exitWith {
	_str = parseText "<t color='#FF0000' size='1.5'><br/>Your vehicle is already full<br/></t>";
	hint _str;
};

DS_doingStuff = true;

while{((fuel (vehicle player)) < 0.99)}do {
	_vehicle = vehicle player;
	_cost = ((gasMoneyArray select 11)*_air);
	if((DS_infoArray select 13) > 39)then{_cost = (_cost*0.5);};

	if([_cost,true] call DS_fnc_checkMoney)exitWith {
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You don't have enough money in your bank to fully refuel your vehicle<br/></t>";
		hint _str;
		_exit = true;
	};

	if(isNull objectParent player)exitWith {
		_str = parseText "<t color='#FF0000' size='1.5'><br/>You must remain in your vehicle to refuel it<br/></t>";
		hint _str;
		_exit = true;
	};

	if(_vehicle distance _pos > 15)exitWith {
		_str = parseText "<t color='#FF0000' size='1.5'><br/>Your refueling was cancelled because you moved your vehicle!<br/></t>";
		hint _str;
		_exit = true;
	};

	_newFuel = ((fuel _vehicle) + 0.1);
	if(local _vehicle)then {
		_vehicle setFuel _newFuel;
	} else {
		[_vehicle,_newFuel] remoteExecCall ["DS_fnc_setFuel",_vehicle];
	};

	if(DS_moral < 400)then {
		_cost = (((gasMoneyArray select 11)*2)*_air);
	} else {
		_cost = ((gasMoneyArray select 11)*_air);
	};

	titleText [format ["...Refueling at a cost of $%1 per 10L...",[_cost] call DS_fnc_numberText],"PLAIN"];
	[_cost,true,false] call DS_fnc_handleMoney;
	_totalCost = _totalCost + _cost;
	sleep 5;
};

if(_exit)exitWith{DS_doingStuff = false;if(DS_coin < 0)then{DS_coin = 0};};

titleText ["...Vehicle Fully Refueled...","PLAIN"];
_str = parseText "<t color='#FF0000' size='1.5'><br/>Vehicle Fully Refueled<br/></t>";
hint _str;

DS_doingStuff = false;

if(DS_coin < 0)then{DS_coin = 0};