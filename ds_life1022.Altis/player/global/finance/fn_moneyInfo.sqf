/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Shows player information on their possible incomes
*/

private ["_total","_standardPay","_gangName","_bonus","_houseUpKeep","_martialLawInfo","_copNLR","_lotto","_tokens"];

_total = 0;
_standardPay = 700;
_gangName = (group player) getVariable ["gangName",""];
_bonus = 0;
_houseUpKeep = 0;
_martialLawInfo = "";

if(playerSide isEqualTo west)then {
	_civNums = civilian countSide allPlayers;

	switch(true)do {
		case (_civNums < 20): {_copNLR = "1"};
		case ((_civNums > 19)&&(_civNums < 30)): {_copNLR = "2"};
		case ((_civNums > 29)&&(_civNums < 40)): {_copNLR = "3"};
		case ((_civNums > 39)&&(_civNums < 50)): {_copNLR = "4"};
		case ((_civNums > 49)&&(_civNums < 60)): {_copNLR = "5"};
		case ((_civNums > 59)&&(_civNums < 70)): {_copNLR = "6"};
		case ((_civNums > 69)&&(_civNums < 80)): {_copNLR = "7"};
		case ((_civNums > 79)&&(_civNums < 90)): {_copNLR = "8"};
		case ((_civNums > 89)&&(_civNums < 100)): {_copNLR = "9"};
		case ((_civNums > 99)&&(_civNums < 110)): {_copNLR = "10"};
		case ((_civNums > 109)&&(_civNums < 120)): {_copNLR = "11"};
		case ((_civNums > 119)&&(_civNums < 130)): {_copNLR = "12"};
		case (_civNums > 130): {_copNLR = "13"};
	};
};
if(DS_lotto isEqualTo [])then{_lotto = "You have no lotto ticket"}else{_lotto = format ["Your lotto numbers are<br/> (%1) (%2) (%3)",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2)]};

if(playerSide isEqualTo civilian)then {
	_myHouses = (count DS_houses);
	_houseUpKeep = (750*_myHouses);
	_tokens = format ["Rebel Tokens: %1",(DS_realEstateArray select 6)];
} else {
	_tokens = "";
};

_rankBonus = 0;
if(playerSide isEqualTo west)then {
	_rankBonus = ((DS_copLevel)*700);
	if((DS_infoArray select 21) > 5)then{_rankBonus = _rankBonus*1.25;};
	if((DS_infoArray select 21) > 7)then{_rankBonus = _rankBonus*1.5;};
};

if(_gangName != "")then {
	_areas = 0;
	_group1 = gangFlag1 getVariable ["gangOwner",grpNull];
	_group2 = gangFlag2 getVariable ["gangOwner",grpNull];
	_group3 = gangFlag3 getVariable ["gangOwner",grpNull];
	_group4 = gangFlag4 getVariable ["gangOwner",grpNull];
	if((!isNull _group1)&&(_group1 isEqualTo (group player)))then{_areas = _areas + 1;};
	if((!isNull _group2)&&(_group2 isEqualTo (group player)))then{_areas = _areas + 1;};
	if((!isNull _group3)&&(_group3 isEqualTo (group player)))then{_areas = _areas + 1;};
	if((!isNull _group4)&&(_group4 isEqualTo (group player)))then{_areas = _areas + 1;};

	_onlinePlayers = {alive _x} count allPlayers;
	if(isNil "_onlinePlayers")then{_onlinePlayers = 0;};

	_bonus = ((10000)*_areas);
	_gangMembers = (count units (group player));
	_bonus = (round(_bonus)/_gangMembers);
	if(_onlinePlayers < 10)then {
		_bonus = _bonus/2;
	} else {
		if(_onlinePlayers > 40)then {
			_bonus = _bonus*2;
		};
	};
};

_tempRent = 0;
if (DS_realEstateArray select 29 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 29)*650);
};
if (DS_realEstateArray select 30 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 30)*950);
};
if (DS_realEstateArray select 31 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 31)*1500);
};
if (DS_realEstateArray select 32 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 32)*2000);
};
if (DS_realEstateArray select 33 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 33)*3000);
};
if (DS_realEstateArray select 34 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 34)*4200);
};
if (DS_realEstateArray select 35 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 35)*5500);
};
if (DS_realEstateArray select 36 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 36)*7500);
};
if (DS_realEstateArray select 37 > 0)then {
	_tempRent = _tempRent + ((DS_realEstateArray select 37)*9500);
};
if (DS_realEstateArray select 28 > 0)then {
	_tempRent = _tempRent + (DS_realEstateArray select 28);
	if((DS_infoArray select 13) == 52)then { [0] call DS_fnc_questCompleted };
};

if(playerSide isEqualTo west)then {
	_total = ((_standardPay)+(_rankBonus)+(_tempRent));
} else {
	_total = ((_tempRent)+(_bonus)+(_standardPay)-(_houseUpkeep));
};

if(miscInfoArray select 8)then {
	_martialLawInfo = "Region Wide Martial Law";
};
if(DS_AirBan)then {
	if(_martialLawInfo == "")then {
		_martialLawInfo = "Region Wide Air Vehicle Ban";
	} else {
		_martialLawInfo = format ["%1<br/>Region Wide Air Vehicle Ban",_martialLawInfo];
	};
};

_falseName = "";
if((DS_realEstateArray select 14) > 0)then {
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_falseName = format ["Your fake ID name is %1",(_randomNames select (DS_realEstateArray select 14))];
};

_clanFunds = "";
switch(true)do {
	case ((getPlayerUID player) in DS_clanBase1): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank1] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase2): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank2] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase3): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank3] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase4): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank4] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase5): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank5] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase6): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank6] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase7): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank7] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase8): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank8] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase9): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank9] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase10): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank10] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase11): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank11] call DS_fnc_numberText];
	};
	case ((getPlayerUID player) in DS_clanBase12): {
		_clanFunds = format ["Clan Funds: $%1",[DS_gangBank12] call DS_fnc_numberText];
	};
	//Businesses
	case ((getPlayerUID player) in DS_clanBase21): {
		_clanFunds = format ["Business Funds: $%1",[DS_gangBank21] call DS_fnc_numberText];
	};
};

if(playerSide isEqualTo west)then {
	_str = parseText format ["<t color='#4CCF00' size='2'>Possible Payment Information</t><br/><br/>

	<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
	<t color='#00BFFF' size='1'>Rank Bonus:</t> $%2<br/>
	<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>
	<t color='#FF4000' size='1.5'>Total $%4</t><br/><br/>
	<t color='#00BFFF' size='1'>Insurance Information</t><br/>
	Life: %5<br/>
	Robbery: %6<br/>
	Terrorism: %7<br/>
	Natural Disaster: %8<br/>
	Fire: %9<br/>
	Burglary: %10<br/><br/>%11<br/><br/>
	If there are %12 or less police online you may break NLR in each area once<br/><br/>%13

	"
	,[_standardPay] call DS_fnc_numberText
	,[_rankBonus] call DS_fnc_numberText
	,[_tempRent] call DS_fnc_numberText
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
} else {
	_str = parseText format ["<t color='#4CCF00' size='2'>Possible Payment Information</t><br/><br/>

	<t color='#00BFFF' size='1'>Paycheck:</t> $%1<br/>
	<t color='#00BFFF' size='1'>Gang Area Bonus:</t> $%2<br/>
	<t color='#00BFFF' size='1'>Rent Payments:</t> $%3<br/><br/>

	<t color='#FF0000' size='1'>House Upkeep:</t> $%4<br/>
	<t color='#FF4000' size='1.5'>Total $%5</t><br/><br/>
	<t color='#00BFFF' size='1'>Insurance Information</t><br/>
	Life: %6<br/>
	Robbery: %7<br/>
	Terrorism: %8<br/>
	Natural Disaster: %9<br/>
	Fire: %10<br/>
	Burglary: %11<br/><br/>%15<br/>
	%12<br/><br/>%13<br/><br/>%14<br/><br/>%16

	"
	,[_standardPay] call DS_fnc_numberText
	,[_bonus] call DS_fnc_numberText
	,[_tempRent] call DS_fnc_numberText
	,[_houseUpkeep] call DS_fnc_numberText
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
	,_clanFunds
	];

	hint _str;
};