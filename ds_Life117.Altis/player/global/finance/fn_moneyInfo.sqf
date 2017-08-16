/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Shows player information on their possible incomes

*/

private ["_martialLawInfo","_gangName","_total","_houseUpKeep","_tokens","_lotto","_copNLR"];
_total = 0;
_insurance = 0;
_insurance = (DS_insurance_vehicles*200);
_extraRent = 0;
_standardPay = 700;
_gangName = (group player) getVariable ["gangName",""];
_bonus = 0;
_houseUpKeep = 0;
_martialLawInfo = "";
if(playerside == west)then
	{
	_civNums = civilian countSide playableUnits;
	if(_civNums < 50)then{_copNLR = "4"}else{
	if((_civNums > 49)&&(_civNums < 60))then{_copNLR = "5"}else{
	if((_civNums > 59)&&(_civNums < 70))then{_copNLR = "6"}else{
	if((_civNums > 69)&&(_civNums < 80))then{_copNLR = "7"}else{
	if(_civNums > 79)then{_copNLR = "8"};};};};};
	};
if(DS_lotto isEqualTo [])then{_lotto = "You have no lotto ticket"}else{_lotto = format ["Your lotto numbers are<br/> (%1) (%2) (%3)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2)]};
if(playerside == civilian)then{_tokens = format ["Rebel Tokens:  %1",(DS_realEstateArray select 6)]}else{_tokens = ""};
if(playerside == civilian)then
	{
	_myHouses = (count DS_houses);
	_houseUpKeep = (500*_myHouses);
	};
_rankBonus = 0;
if(playerside == west)then{_rankBonus = ((DS_copLevel)*700)};
if((playerside == west)&&((DS_infoArray select 21) > 7))then{_rankBonus = _rankBonus*1.25;};
if(_gangName != "")then
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
	if(isNil {_onlinePlayers})then{_onlinePlayers = 0;};
	_bonus = ((10000)*_areas);
	_gangMembers = (count units (group player));
	_bonus = (round(_bonus)/_gangMembers);
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
	}
	else
	{
	_bonus = 0;
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
	
	if(playerside == west)then
		{
		_total = ((_standardPay)+(_rankBonus)+(_tempRent)-(_insurance));
		}
		else
		{
		_total = ((_tempRent)+(_bonus)+(_standardPay)-(_houseUpkeep)-(_insurance));
		};
		
if(miscInfoArray select 9)then
	{
	_martialLawInfo = "Martial Law in Athira";
	};
if(miscInfoArray select 10)then
	{
	_martialLawInfo = "Martial Law in Sofia";
	};
if(miscInfoArray select 11)then
	{
	_martialLawInfo = "Martial Law in Pyrgos";
	};
if(miscInfoArray select 12)then
	{
	_martialLawInfo = "Martial Law at main Air Field";
	};
if((_martialLawInfo == "")&&(miscInfoArray select 8))then
	{
	_martialLawInfo = "Server Wide Martial Law";
	};
if(DS_AirBan)then
	{
	if(_martialLawInfo == "")then
		{
		_martialLawInfo = "Island Wide Air Vehicle Ban";
		}
		else
		{
		_martialLawInfo = _martialLawInfo + "<br/>Island Wide Air Vehicle Ban";
		};
	};

_falseName = "";	
if((DS_realEstateArray select 15) > 0)then
	{
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_falseName = format ["Your fake ID name is %1",(_randomNames select (DS_realEstateArray select 15))];
	};
	
	if(playerside == west)then
		{
		
		_str = parseText format ["<t color='#4CCF00' size='2'>Possible Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Rank Bonus:</t> $%2<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>
		<t color='#FF4000' size='1.5'>Total $%5</t><br/><br/>
		<t color='#00BFFF' size='1'>Insurance Information</t><br/>
		Life: %6<br/>
		Robbery: %7<br/>
		Terrorism: %8<br/>
		Natural Disaster: %9<br/>
		Fire: %10<br/>
		Burglary: %11<br/><br/>%12<br/><br/>
		If there is %13 or less police online you may break NLR in each area once<br/><br/>%14
		
		"
		,[_standardPay] call DS_fnc_numberText
		,[_rankBonus] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,[_insurance] call DS_fnc_numberText
		,[_total] call DS_fnc_numberText
		,(DS_realEstateArray select 0)
		,(DS_realEstateArray select 1)
		,(DS_realEstateArray select 2)
		,(DS_realEstateArray select 3)
		,(DS_realEstateArray select 4)
		,(DS_realEstateArray select 5)
		,_lotto
		,_copNLR
		,_martialLawInfo
		];
		
		hint _str;
		
		}
		else
		{
	
		_str = parseText format ["<t color='#4CCF00' size='2'>Possible Payment Information</t><br/><br/>

		<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
		<t color='#00BFFF' size='1'>Gang Area Bonus:</t> $%2<br/>
		<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>
		
		<t color='#FF0000' size='1'>House Upkeep:</t> $%4<br/>
		<t color='#FF4000' size='1.5'>Total $%6</t><br/><br/>
		<t color='#00BFFF' size='1'>Insurance Information</t><br/>
		Life: %7<br/>
		Robbery: %8<br/>
		Terrorism: %9<br/>
		Natural Disaster: %10<br/>
		Fire: %11<br/>
		Burglary: %12<br/><br/>%16<br/>
		%13<br/><br/>%14<br/><br/>%15

		"
		,[_standardPay] call DS_fnc_numberText
		,[_bonus] call DS_fnc_numberText
		,[_tempRent] call DS_fnc_numberText
		,[_houseUpkeep] call DS_fnc_numberText
		,[_insurance] call DS_fnc_numberText
		,[_total] call DS_fnc_numberText
		,(DS_realEstateArray select 0)
		,(DS_realEstateArray select 1)
		,(DS_realEstateArray select 2)
		,(DS_realEstateArray select 3)
		,(DS_realEstateArray select 4)
		,(DS_realEstateArray select 5)
		,_tokens
		,_lotto
		,_martialLawInfo
		,_falseName
		];
		
		hint _str;
		
		};
if(!DS_gearfix)then
	{
	DS_gearfix = true;
//Fix clothes till arma does
		if(playerside != civilian)then
			{
			_uniform = (uniform player);
			_vest = (vest player);
			_uniformMags = (uniformItems player);
			_vestMags = (vestItems player);
			player forceAddUniform _uniform;
			player addVest _vest;
			{
				[_x,false,true] call DS_fnc_equipItem;
			} foreach _vestMags;
			{
				[_x,false,false,false,true] call DS_fnc_equipItem;
			} foreach _uniformMags;
			[] call DS_fnc_copUniform;
			};
		sleep 60;
		DS_gearfix = false;
	};