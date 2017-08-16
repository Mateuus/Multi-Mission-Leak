/*
Author: Shawn "Huntah" Macgillivray
	
			Description:
			Handles all routine payments to players
*/

private ["_myGang","_standardPay","_extraRent","_insurance","_str","_stringArray","_tempNum","_tempRent","_lastPos","_damage","_damageAmount","_damageString","_myHouses","_donorBonus","_rankBonus","_houseUpKeep","_total","_paytime","_hideout1","_hideout2","_hideout3","_group1","_group2","_group3","_areas","_bonus","_UID","_gangMembers","_onlinePlayers","_loanRepayments","_loanValue","_damageArray","_damageString2","_randomNum","_damageString1","_payStr","_newTotal"];

_insurance = 0;
_insurance = (DS_insurance_vehicles*200);
_extraRent = 0;
_standardPay = 700;
_bonus = 0;
if(!isNil {DS_houses})then
	{
	_myHouses = (count DS_houses);
	}
	else
	{
	_myHouses = 0
	};
_rankBonus = 0;
if(playerside == west)then{_rankBonus = ((DS_copLevel)*700)};
if((playerside == west)&&((DS_infoArray select 21) > 7))then{_rankBonus = _rankBonus*1.25;};
_houseUpKeep = (500*_myHouses);
sleep 600;
while {true} do
	{
	_extraRent = 0;//[] call DS_fnc_getPayments;
	_areas = 0;
	_hideout1 = (nearestObjects[gangFlag1,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	_hideout2 = (nearestObjects[gangFlag2,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	_hideout3 = (nearestObjects[gangFlag3,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	_group1 = _hideout1 getVariable ["gangOwner",grpNull];
	_group2 = _hideout2 getVariable ["gangOwner",grpNull];
	_group3 = _hideout3 getVariable ["gangOwner",grpNull];
	if((!isNull _group1)&&(_group1 == (group player)))then{_areas = _areas + 1;};
	if((!isNull _group2)&&(_group2 == (group player)))then{_areas = _areas + 1;};
	if((!isNull _group3)&&(_group3 == (group player)))then{_areas = _areas + 1;};
	_onlinePlayers = {alive _x} count PlayableUnits;
	sleep 5;
	if(isNil {_onlinePlayers})then{_onlinePlayers = 0;};
	_bonus = ((10000)*_areas);
	if((_areas == 3)&&((DS_infoArray select 15) == 25))then
		{
		[1] call DS_fnc_questCompleted;
		};
	if((_areas == 3)&&((DS_infoArray select 15) == 30))then
		{
		_tempNum = (DS_infoArray select 16);
		_tempNum = _tempNum + 1;
		DS_infoArray set [16,_tempNum];
		if((DS_infoArray select 16) > 4)then
			{
			[1] call DS_fnc_questCompleted;
			};
		};
	_gangMembers = (count units (group player));
	_bonus = (round(_bonus)/_gangMembers);
	if((DS_infoArray select 15) > 31)then
		{
		_bonus = (_bonus*2);
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
	_tempRent = _tempRent + ((DS_realEstateArray select 29)*600);
	};
	if (DS_realEstateArray select 30 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 30)*900);
	};
	if (DS_realEstateArray select 31 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 31)*1100);
	};
	if (DS_realEstateArray select 32 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 32)*2500);
	};
	if (DS_realEstateArray select 33 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 33)*3250);
	};
	if (DS_realEstateArray select 34 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 34)*4000);
	};
	if (DS_realEstateArray select 35 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 35)*6500);
	};
	if (DS_realEstateArray select 36 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 36)*9000);
	};
	if (DS_realEstateArray select 37 > 0)then
	{
	_tempRent = _tempRent + ((DS_realEstateArray select 37)*11200);
	};
	
	_tempRent = _tempRent + _extraRent;
	
	_damageArrayFire =
	[
	"An unexploded mine from the civil war went off nearby one of your properties",
	"An out of control forest fire has rampaged your property",
	"A hatchback sport driven by an under-aged officer caught fire outside your property",
	"A police Kajman was shot down nearby your property and exploded"
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
	"a twister ripped through your properties neighbourhood"
	];
	
	_damageArrayTerrorist =
	[
	"an explosion at the power station caused by terrorist damaged your electrical appliances",
	"terrorist and police battled it out nearby your property",
	"a terrorist ghosthawk crash landed on your lawn",
	"a massive amount of IED's went off nearby your properties"
	];
	
	_damageArrayNomral =
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
				_randomNum = (floor(random(count _damageArrayTerrorist)));
				_damageString2 = (_damageArrayTerrorist select _randomNum);
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
					_randomNum = (floor(random(count _damageArrayNatural)));
					_damageString2 = (_damageArrayNatural select _randomNum);
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
							_randomNum = (floor(random(count _damageArrayFire)));
							_damageString2 = (_damageArrayFire select _randomNum);
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
									_randomNum = (floor(random(count _damageArrayBurgle)));
									_damageString2 = (_damageArrayBurgle select _randomNum);
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
										_randomNum = (floor(random(count _damageArrayNomral)));
										_damageString2 = (_damageArrayNomral select _randomNum);
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
	
	if(((DS_infoArray select 13) > 38)&&(_damageAmount > 0))then
		{
		_num = random 100;
		if(_num > 50)then
			{
			_damageString1 = "";
			_damageString = "";
			_damageAmount = 0;
			};
		};
	
	if(playerside == west)then
		{
		_rankBonus = ((DS_copLevel)*700);
		_standardPay = 700;
		if((DS_infoArray select 21) > 7)then{_rankBonus = _rankBonus*1.25;};
		if((DS_copLevel > 0)&&((player getVariable ["policeAction",""]) == ""))then{_rankBonus = 0;_standardPay = 0;};
		_total = ((_standardPay)+(_rankBonus)+(_tempRent)-(_damageAmount)-(_insurance));
		}
		else
		{
		_total = ((_tempRent)+(_bonus)+(_standardPay)-(_houseUpkeep)-(_damageAmount)-(_insurance));
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
	
	if(playerside == west)then
		{
		
		_str = parseText format ["<t color='#4CCF00' size='2'>Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Rank Bonus:</t> $%3<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%5<br/><br/>
		
		<t color='#B40404' size='1'>%7</t><br/><br/>
		
		<t color='#FF0000' size='1'>Property Damages:</t> $%6<br/>
		<t color='#FF0000' size='1'>Insurance Premium:</t> $%10<br/>
		<t color='#FF0000' size='1'>Loan Repayments:</t> $0<br/><br/>
		
		<t color='#FFFF00'>Your payments have been deposited into your bank account</t><br/><br/>
		<t color='#FF4000' size='1.5'>$%4 %9</t>

		"
		,[_standardPay] call DS_fnc_numberText
		,[_rankBonus] call DS_fnc_numberText
		,[_rankBonus] call DS_fnc_numberText
		,[_newTotal] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,[_damageAmount] call DS_fnc_numberText
		,_damageString
		,[_damageAmount] call DS_fnc_numberText
		,_payStr
		,[_insurance] call DS_fnc_numberText
		];
		
		hint _str;
		
		}
		else
		{
	
		_str = parseText format ["<t color='#4CCF00' size='2'>Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Gang Area Bonus:</t> $%3<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%4<br/><br/>
		
		<t color='#B40404' size='1'>%8</t><br/><br/>
		
		<t color='#FF0000' size='1'>House Upkeep:</t> $%5<br/>
		<t color='#FF0000' size='1'>Insurance Premium:</t> $%11<br/>
		<t color='#FF0000' size='1'>Property Damages:</t> $%6<br/><br/><br/>

		<t color='#FFFF00'>Your payments have been deposited into your bank account</t><br/><br/>
		<t color='#FF4000' size='1.5'>$%7 %10</t>

		"
		,[_standardPay] call DS_fnc_numberText
		,[_standardPay] call DS_fnc_numberText
		,[_bonus] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,[_houseUpkeep] call DS_fnc_numberText
		,[_damageAmount] call DS_fnc_numberText
		,[_newTotal] call DS_fnc_numberText
		,_damageString
		,[_damageAmount] call DS_fnc_numberText
		,_payStr
		,[_insurance] call DS_fnc_numberText
		];
		
		};

		hint _str;
		
		player say3D "Cash";
		sleep 1;
		["PayCheck",[format["Income $%1",[_total] call DS_fnc_numberText]]] call bis_fnc_showNotification;
		[_total,true,true] call DS_fnc_handleMoney;
		/*
		if((DS_atmcoin > 0)&&((life_realEstateArray select 10) > 0))then
			{
			_loanValue = life_realEstateArray select 10;
			_loanValue = _loanValue - _loanRepayments;
			life_realEstateArray set [10,_loanValue];
			};
		*/
	//_payTime = (time + 10);//600
	
	//waitUntil {(time > _payTime)};
	if(DS_donorLevel > 0)then
		{
		[] call DS_fnc_compileData;
		};
		
	//Fix clothes till arma does
	/*
	if(playerside != civilian)then
		{
		_uniform = (uniform player);
		_vest = (vest player);
		_uniformMags = (uniformItems player);
		_vestMags = (vestItems player);
		_backpackItems = (backpackItems player);
		player forceAddUniform _uniform;
		player addVest _vest;
		[] call DS_fnc_copUniform;
		};
	*/	
	sleep 600;
	};
//if(alive player)exitwith{};
//[]execVM "core\realEstate\payRent.sqf";