/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fuel delivery missions
*/

private ["_tempNum"];

_earnedMoney = 0;
_payPerM = 7;
if(DS_realMode)then{_payPerM = (_payPerM*1.5)};
_distance = 0;
_lastLoc = (getPos player);
_jobsDepots = ["jobs1","jobs1_1","jobs1_2","jobs1_3","jobs1_5"];
_fuelTrucksAll = ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","C_Van_01_fuel_F","C_Van_01_fuel_F"];

_fuelDeliveryArray = [
	getMarkerPos "Gas1_1_1_2_1_1_1_1",getMarkerPos "Gas1_1_1_2_1_1_1_1_1",getMarkerPos "f_1_1",getMarkerPos "bv_1_1",getMarkerPos "hospital_2",
	getMarkerPos "Gas1_1_1_1",getMarkerPos "f_1",getMarkerPos "Gas1_1_1_2_1_1",getMarkerPos "kavTruck_1_1",getMarkerPos "Gas1_1_1_2_1",
	getMarkerPos "powerMarker",getMarkerPos "Gas1_1",getMarkerPos "oilp_1_3_1",getMarkerPos "Gas1",getMarkerPos "Gas1_1_1",getMarkerPos "Gas1_2",getMarkerPos "bv_1_1_1"
];

if(isNil "DS_fuelMission")then{DS_fuelMission = false};
if(DS_fuelMission)exitWith{hint "You already have a fuel mission active"};
DS_fuelMission = true;

//First drop point
_dropPoint = selectRandom _fuelDeliveryArray;

while{((player distance _dropPoint > 10000)||(player distance _dropPoint < 1000))}do {
	_dropPoint = selectRandom _fuelDeliveryArray;
};

systemChat "Your job is to deliver fuel to 3 locations. You must arrive to each location in a fuel truck";
hint "Your job is to deliver fuel to 3 locations. You must arrive to each location in a fuel truck";

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive your fuel truck to the first marker to deliver fuel","Fuel Delivery","Drop Fuel Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_completed = false;
_distance = (_lastLoc distance _dropPoint);
_lastLoc = _dropPoint;

while{true}do {
	if(player distance _dropPoint < 20)then {
		if(typeOf (vehicle player) in _fuelTrucksAll)then {
			_completed = true;
		} else {
			hint "You're at the drop point but you must be inside a fuel truck to deliver the fuel";
		};
	};
	if((getPos (vehicle player) select 2) > 20)exitWith{hint "Mission failed";DS_fuelMission = false;DS_civJobTask setTaskState "Failed";};
	if(_completed)exitWith{};
	sleep 10;
};

if(!_completed)exitWith{};

_payment = round(_payPerM*_distance);
if((typeOf (vehicle player)) == "C_Van_01_fuel_F")then {
	_payment = (_payment*0.7);
};
if((gasMoneyArray select 11) > 1000)then {
	_payment = (_payment*3);
} else {
	if((gasMoneyArray select 11) > 500)then {
		_payment = (_payment*2);
	};
};
_earnedMoney = _earnedMoney + _payment;

DS_civJobTask setTaskState "Succeeded";
hint format ["You've dropped off your first load of fuel, that run has earned you $%1. You will receive this upon completion, your next delivery point is now ready",[_payment] call DS_fnc_numberText];
systemChat format ["You've dropped off your first load of fuel, that run has earned you $%1. You will receive this upon completion, your next delivery point is now ready",[_payment] call DS_fnc_numberText];

//Second drop point
_dropPoint = selectRandom _fuelDeliveryArray;

while{((player distance _dropPoint > 10000)||(player distance _dropPoint < 1000))}do {
	_dropPoint = selectRandom _fuelDeliveryArray;
};

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive your fuel truck to the second marker to deliver fuel","Fuel Delivery","Drop Fuel Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_completed = false;
_distance = (_lastLoc distance _dropPoint);
_lastLoc = _dropPoint;

while{true}do {
	if(player distance _dropPoint < 20)then {
		if(typeOf (vehicle player) in _fuelTrucksAll)then {
			_completed = true;
		} else {
			hint "You're at the drop point but you must be inside a fuel truck to deliver the fuel";
		};
	};
	if((getPos (vehicle player) select 2) > 20)exitWith{hint "Mission failed";DS_fuelMission = false;DS_civJobTask setTaskState "Failed";};
	if(_completed)exitWith{};
	sleep 10;
};

if(!_completed)exitWith{};

_payment = round(_payPerM*_distance);
if((typeOf (vehicle player)) == "C_Van_01_fuel_F")then {
	_payment = (_payment*0.7);
};
if((gasMoneyArray select 11) > 1000)then {
	_payment = (_payment*3);
} else {
	if((gasMoneyArray select 11) > 500)then {
		_payment = (_payment*2);
	};
};
_earnedMoney = _earnedMoney + _payment;

DS_civJobTask setTaskState "Succeeded";
hint format ["You've dropped off your second load of fuel, that run has earned you $%1. You will receive this upon completion, your last delivery point is now ready",[_payment] call DS_fnc_numberText];
systemChat format ["You've dropped off your second load of fuel, that run has earned you $%1. You will receive this upon completion, your last delivery point is now ready",[_payment] call DS_fnc_numberText];

//Third drop point
_dropPoint = selectRandom _fuelDeliveryArray;

while{((player distance _dropPoint > 10000)||(player distance _dropPoint < 1000))}do {
	_dropPoint = selectRandom _fuelDeliveryArray;
};

player removeSimpleTask DS_civJobTask;
DS_civJobTask = player createSimpleTask ["civJobTask"];
DS_civJobTask setSimpleTaskDescription ["Drive your fuel truck to the third marker to deliver fuel","Fuel Delivery","Drop Fuel Here"];
DS_civJobTask setSimpleTaskDestination _dropPoint;
DS_civJobTask setTaskState "Assigned";
player setCurrentTask DS_civJobTask;

_completed = false;
_distance = (_lastLoc distance _dropPoint);
_lastLoc = _dropPoint;

while{true}do {
	if(player distance _dropPoint < 20)then {
		if(typeOf (vehicle player) in _fuelTrucksAll)then {
			_completed = true;
		} else {
			hint "You're at the drop point but you must be inside a fuel truck to deliver the fuel";
		};
	};
	if((getPos (vehicle player) select 2) > 20)exitWith{hint "Mission failed";DS_fuelMission = false;DS_civJobTask setTaskState "Failed";};
	if(_completed)exitWith{};
	sleep 10;
};

if(!_completed)exitWith{};

_payment = round(_payPerM*_distance);
if((typeOf (vehicle player)) == "C_Van_01_fuel_F")then {
	_payment = (_payment*0.7);
};
if((gasMoneyArray select 11) > 1000)then {
	_payment = (_payment*3);
} else {
	if((gasMoneyArray select 11) > 500)then {
		_payment = (_payment*2);
	};
};
_earnedMoney = _earnedMoney + _payment;

DS_civJobTask setTaskState "Succeeded";
hint format ["You've dropped off your last load of fuel, that run has earned you $%1. You will receive this upon completion. You must now return to any jobs depot for payment",[_payment] call DS_fnc_numberText];
systemChat format ["You've dropped off your last load of fuel, that run has earned you $%1. You will receive this upon completion. You must now return to any jobs depot for payment",[_payment] call DS_fnc_numberText];

//Near jobs depot check
_done = false;
while{true}do {
	{
		if(player distance (getMarkerPos _x) < 20)then {
			_done = true;
		};
	} forEach _jobsDepots;
	if(_done)exitWith{};
	sleep 10;
};

hint format ["You have completed your fuel run and have been paid $%1",[_earnedMoney] call DS_fnc_numberText];
systemChat format ["You have completed your fuel run and have been paid $%1",[_earnedMoney] call DS_fnc_numberText];
[_earnedMoney,true,true] call DS_fnc_handleMoney;
DS_fuelMission = false;
[1] spawn DS_civ_improve;

if((gasMoneyArray select 11) > 15)then {
	_amountToLower = (round((gasMoneyArray select 11)/25));
	if(_amountToLower < 10)then {_amountToLower = 10};
	_newPrice = ((gasMoneyArray select 11) - _amountToLower);
	gasMoneyArray set[11,_newPrice];
	publicvariable "gasMoneyArray";
	hint format ["You have had the fuel price lowered by $%1",[_amountToLower] call DS_fnc_numberText];
};

[75,true] spawn DS_fnc_moralAlter;

sleep 5;

if((DS_infoArray select 13) == 12)then {
	[0] call DS_fnc_questCompleted;
};

if((DS_infoArray select 13) == 29)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 2)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};

if((DS_infoArray select 13) == 41)then {
	_tempNum = (DS_infoArray select 14) + 1;
	if(_tempNum > 2)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};