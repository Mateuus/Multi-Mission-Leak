/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Pay toll at bridge
*/

private ["_tollAmount"];

if(playerSide isEqualTo west)exitwith{};
if(!((vehicle player) isKindOf "LandVehicle"))exitwith{};
if(isNil "DS_paidToll")then{DS_paidToll = false};
if(DS_paidToll)exitwith{};
DS_paidToll = true;

_tollAmount = 500;
if(DS_atmCoin > 1000000)then{_tollAmount = 1000};
if(DS_atmCoin > 5000000)then{_tollAmount = 2000};
if(DS_atmCoin > 10000000)then{_tollAmount = 4000};
if(DS_atmCoin > 15000000)then{_tollAmount = 8000};
if(DS_atmCoin > 20000000)then{_tollAmount = 12000};
if(DS_atmCoin > 50000000)then{_tollAmount = 20000};

//New bridge!! Double Charge them mwhahahaha
if(player distance tollBooth2 < 500)then
	{
	_tollAmount = (_tollAmount*2);
	};

[_tollAmount,true,false] call DS_fnc_handleMoney;
player say3D "cash";
hint format ["You have paid $%1 because you drove past a tollbooth, if you are still in the area in 1 minutes time you will be charged again",[_tollAmount] call DS_fnc_numberText];
systemchat format ["You have paid $%1 because you drove past a tollbooth, if you are still in the area in 1 minutes time you will be charged again",[_tollAmount] call DS_fnc_numberText];

sleep 10;
if((DS_infoArray select 13) == 15)then {
	[0] call DS_fnc_questCompleted;
};

sleep 60;
DS_paidToll = false;