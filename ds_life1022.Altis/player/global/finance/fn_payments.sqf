/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Handles all routine payments to players
*/

private ["_tempNum","_leftOver","_price","_standardPay","_extraRent","_str","_stringArray","_tempNum","_tempRent","_lastPos","_damage","_damageAmount","_damageString","_myHouses","_donorBonus","_rankBonus","_houseUpKeep","_total","_paytime","_hideout1","_hideout2","_hideout3","_group1","_group2","_group3","_areas","_bonus","_UID","_gangMembers","_onlinePlayers","_loanRepayments","_loanValue","_damageArray","_damageString2","_damageString1","_payStr","_newTotal"];

_extraRent = 0;
_standardPay = 700;
_bonus = 0;
if(!isNil "DS_houses")then
	{
	_myHouses = (count DS_houses);
	}
	else
	{
	_myHouses = 0
	};
_rankBonus = 0;
if(playerSide isEqualTo west)then{_rankBonus = ((DS_copLevel)*700)};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 5))then{_rankBonus = _rankBonus*1.25;};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 7))then{_rankBonus = _rankBonus*1.5;};
if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 35))then{_rankBonus = _rankBonus*2;};
_houseUpKeep = (750*_myHouses);
sleep 600;
while {true} do
	{
	_groupMembers = 0;
	if(playerSide isEqualTo civilian)then
		{
			{
			if(isPlayer _x)then
				{
				_groupMembers = _groupMembers+ 1;
				};
			}forEach (units (group player));
		if(_groupMembers > 15)then
			{
			hint "Your gang was over its member limit, therefore you were kicked";
			[player] joinSilent (createGroup civilian);
			};
		};
	_extraRent = 0;//[] call DS_fnc_getPayments;
	_areas = 0;
	_hideout1 = gangFlag1;
	_hideout2 = gangFlag2;
	_hideout3 = gangFlag3;
	_hideout4 = gangFlag4;
	_group1 = _hideout1 getVariable ["gangOwner",grpNull];
	_group2 = _hideout2 getVariable ["gangOwner",grpNull];
	_group3 = _hideout3 getVariable ["gangOwner",grpNull];
	_group4 = _hideout4 getVariable ["gangOwner",grpNull];
	if((!isNull _group1)&&(_group1 == (group player)))then{_areas = _areas + 1;};
	if((!isNull _group2)&&(_group2 == (group player)))then{_areas = _areas + 1;};
	if((!isNull _group3)&&(_group3 == (group player)))then{_areas = _areas + 1;};
	if((!isNull _group4)&&(_group4 == (group player)))then{_areas = _areas + 1;};
	_onlinePlayers = {alive _x} count allPlayers;
	sleep 5;
	if(isNil "_onlinePlayers")then{_onlinePlayers = 0;};
	_bonus = ((10000)*_areas);
	_gangMembers = (count units (group player));
	_bonus = (round(_bonus)/_gangMembers);
	if((DS_infoArray select 15) > 37)then
		{
		_bonus = (_bonus*2);
		};
	if((_areas > 2)&&((DS_infoArray select 15) == 28))then { [1] call DS_fnc_questCompleted };
	if((_areas > 2)&&((DS_infoArray select 15) == 36))then {
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 4)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if(_onlinePlayers < 10)then
	{
	_bonus = _bonus/2;
	}
	else
	{
	if(_onlinePlayers > 40)then
		{
		_bonus = _bonus*2;
		};
	};

	_tempRent = 0;
	_tempNum = 0;
	_damageAmount = 0;
	_damageString = "";

	if (DS_realEstateArray select 29 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 29)*650);
		};
	if (DS_realEstateArray select 30 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 30)*950);
		};
	if (DS_realEstateArray select 31 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 31)*1500);
		};
	if (DS_realEstateArray select 32 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 32)*2000);
		};
	if (DS_realEstateArray select 33 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 33)*3000);
		};
	if (DS_realEstateArray select 34 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 34)*4200);
		};
	if (DS_realEstateArray select 35 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 35)*5500);
		};
	if (DS_realEstateArray select 36 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 36)*7500);
		};
	if (DS_realEstateArray select 37 > 0)then
		{
		_tempRent = _tempRent + ((DS_realEstateArray select 37)*9500);
		};
	if (DS_realEstateArray select 28 > 0)then
		{
		_tempRent = _tempRent + (DS_realEstateArray select 28);
		};

	_tempRent = _tempRent + _extraRent;

	_damageArrayFire =
	[
	"an unexploded mine from the civil war went off nearby one of your properties",
	"an out of control forest fire rampaged your property",
	"a hatchback sport driven by an under-aged officer caught fire outside your property",
	"a police Kajman was shot down nearby your property and exploded"
	];

	_damageArrayBurgle =
	[
	"your property was raided by the police",
	"rebels from Stratis ransacked one of your properties",
	"burglars broke into one of your properties and stole all the windows",
	"a shop ran from one of your properties was robbed"
	];

	_damageArrayNatural =
	[
	"there was an earthquake near your property",
	"flood waters has turned your property into a river",
	"a volcano has erupted near your property",
	"a tornado ripped through your property's neighbourhood"
	];

	_damageArrayTerrorist =
	[
	"an explosion at the power station caused by terrorists damaged your electrical appliances",
	"terrorist and police battled it out nearby your property",
	"a terrorist Ghost Hawk crash landed on your lawn",
	"a massive amount of IED's went off nearby your properties"
	];

	_damageArrayNormal =
	[
	"rusty water pipes fall apart causing water damage",
	"all your windows were smashed during a raging house party",
	"a tenant drove his car through the garage into your property",
	"an oven in one of your properties needed replacing"
	];

	//Damages?
	_damage = random 100;
	if(_tempRent > 0)then{
	if(_damage > 95)then
		{
		if((DS_realEstateArray select 2) == 0)then
			{
			if(DS_moral < 700)then
				{
				_damageAmount = (_tempRent*5);
				_damageString2 = (selectRandom _damageArrayTerrorist);
				};
			}
			else
			{
			if(DS_moral < 700)then
				{
				_tempNum = DS_realEstateArray select 2;
				_tempNum = _tempNum - 1;
				DS_realEstateArray set [2,_tempNum];
				};
			};
		}
		else
		{
			if(_damage > 90)then
				{
				if((DS_realEstateArray select 3) == 0)then
					{
					_damageAmount = (_tempRent*3);
					_damageString2 = (selectRandom _damageArrayNatural);
					}
					else
					{
					_tempNum = DS_realEstateArray select 3;
					_tempNum = _tempNum - 1;
					DS_realEstateArray set [3,_tempNum];
					};
				}
				else
				{
					if(_damage > 85)then
						{
						if((DS_realEstateArray select 4) == 0)then
							{
							_damageAmount = (_tempRent+(random 10000));
							_damageString2 = (selectRandom _damageArrayFire);
							}
							else
							{
							_tempNum = DS_realEstateArray select 4;
							_tempNum = _tempNum - 1;
							DS_realEstateArray set [4,_tempNum];
							};
						}
						else
						{
							if(_damage > 80)then
								{
								if((DS_realEstateArray select 5) == 0)then
									{
									_damageAmount = (_tempRent/2) + (random 10000);
									_damageString2 = (selectRandom _damageArrayBurgle);
									}
									else
									{
									_tempNum = DS_realEstateArray select 5;
									_tempNum = _tempNum - 1;
									DS_realEstateArray set [5,_tempNum];
									};
								}
								else
								{
								if(_damage > 70)then
									{
									_damageAmount = (_tempRent/4)  + (random 2000);
									_damageString2 = (selectRandom _damageArrayNormal);
									};
								};
						};
				};
		};
	};

	if(_damageAmount > 0)then
		{
		_damageString1 = format ["You have received a bill for property damages of $%1 because ",[_damageAMount] call DS_fnc_numberText];
		_damageString = format ["%1%2",_damageString1,_damageString2];
		};

	if(((DS_infoArray select 13) > 46)&&(_damageAmount > 0))then
		{
		_num = random 100;
		if(_num > 50)then
			{
			_damageString1 = "";
			_damageString = "";
			_damageAmount = 0;
			};
		};

	if(playerSide isEqualTo west)then
		{
		_rankBonus = ((DS_copLevel)*700);
		_standardPay = 700;
		if((DS_infoArray select 21) > 5)then{_rankBonus = _rankBonus*1.25;};
		if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 7))then{_rankBonus = _rankBonus*1.5;};
		if((DS_copLevel > 0)&&((player getVariable ["policeAction",""]) == ""))then{_rankBonus = 0;_standardPay = 0;};
		_total = ((_standardPay)+(_rankBonus)+(_tempRent)-(_damageAmount));
		}
		else
		{
		_total = ((_tempRent)+(_bonus)+(_standardPay)-(_houseUpkeep)-(_damageAmount));
		};

	if(_total > 0)then
			{
			_newTotal = _total;
			_payStr = "Added";
			systemchat format ["Total Income: $%1",[_newTotal] call DS_fnc_numberText];
			}
			else
			{
			_newTotal = (_total*-1);
			_payStr = "Deducted";
			systemchat format ["Total Deductions: $%1",[_newTotal] call DS_fnc_numberText];
			};

	if(playerSide isEqualTo west)then
		{
		_str = parseText format ["<t color='#4CCF00' size='2'>Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Rank Bonus:</t> $%2<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>

		<t color='#B40404' size='1'>%4</t><br/><br/>

		<t color='#FF0000' size='1'>Property Damages:</t> $%5<br/><br/><br/>

		<t color='#FFFF00'>Your payments have been deposited into your bank account</t><br/><br/>
		<t color='#FF4000' size='1.5'>$%6 %7</t>

		"
		,[_standardPay] call DS_fnc_numberText
		,[_rankBonus] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,_damageString
		,[_damageAmount] call DS_fnc_numberText
		,[_newTotal] call DS_fnc_numberText
		,_payStr
		];

		hint _str;
		}
		else
		{
		_str = parseText format ["<t color='#4CCF00' size='2'>Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Gang Area Bonus:</t> $%2<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>

		<t color='#B40404' size='1'>%4</t><br/><br/>

		<t color='#FF0000' size='1'>House Upkeep:</t> $%5<br/>
		<t color='#FF0000' size='1'>Property Damages:</t> $%6<br/><br/><br/>

		<t color='#FFFF00'>Your payments have been deposited into your bank account</t><br/><br/>
		<t color='#FF4000' size='1.5'>$%7 %8</t>

		"
		,[_standardPay] call DS_fnc_numberText
		,[_bonus] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,_damageString
		,[_houseUpkeep] call DS_fnc_numberText
		,[_damageAmount] call DS_fnc_numberText
		,[_newTotal] call DS_fnc_numberText
		,_payStr
		];
		};

	hint _str;

	player say3D "Cash";
	sleep 1;
	_total = floor(_total);
	["PayCheck",[format["Income $%1",[_total] call DS_fnc_numberText]]] call bis_fnc_showNotification;
	[_total,true,true] call DS_fnc_handleMoney;

	//Fix cop lives for a while
	_lives = (DS_infoArray select 9);
	if((_lives > 50)&&(playerSide isEqualTo west))then
		{
		_leftOver = 0;
		_leftOver = _lives - 50;
		_leftOver = (_leftOver/10);
		_price = 0;
		switch(DS_copLevel)do
			{
			case 0:
				{
				_price = 25000;
				};
			case 1:
				{
				_price = 35000;
				};
			case 2:
				{
				_price = 45000;
				};
			case 3:
				{
				_price = 70000;
				};
			case 4:
				{
				_price = 90000;
				};
			case 5:
				{
				_price = 110000;
				};
			case 6:
				{
				_price = 130000;
				};
			case 7:
				{
				_price = 150000;
				};
			case 8:
				{
				_price = 150000;
				};
			case 9:
				{
				_price = 150000;
				};
			case 10:
				{
				_price = 150000;
				};
			case 11:
				{
				_price = 150000;
				};
			};
		sleep 10;
		player say3D "dingDong";
		_leftOver = ((_leftOver*_price)*0.75);
		hint format ["You were over the limit of allowed police lives, the new limit is 50. $%1 has been credited back to your bank account",[_leftOver] call DS_fnc_numberText];
		[_leftOver,true,true] call DS_fnc_handleMoney;
		DS_infoArray set [9,50];
		//[] call DS_fnc_compileData;
		};

	//waitUntil {(time > _payTime)};
	if(DS_donorLevel > 0)then
		{
		[] call DS_fnc_compileData;
		};

	sleep 600;
	};

//if(alive player)exitwith{};