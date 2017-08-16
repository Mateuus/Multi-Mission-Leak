/*
	File: fn_checkChargesPlayerReturn.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/
private["_charges","_cop","_criminal","_crimeList","_tempStr","_newCrimeList","_jailTime","_maxTime","_rebel","_rebelVeh","_extraInfo","_bankRobber","_countsArray","_counter"];

_charges = _this select 0;
_criminal = _this select 2;
_rebel = _this select 3;
_rebelVeh = _this select 4;
_bankRobber = _this select 5;
_countsArray = [];
_tempStr = "";
_newCrimeList = "";
_extraInfo = "";
_jailTime = _charges select 0;
_jailTime = (round(_jailTime/1000));
if(_jailTime == 0)then{_jailTime = 1;};
if(_rebelVeh)then{_maxTime = 30;_jailTime = 30}else{if(_rebel)then{_maxTime = 25}else{_maxTime = 20};};
if(_bankRobber)then{_extraInfo = _extraInfo + "This person has recently robbed the bank" + "<br/><br/>";};

if(_jailTime > _maxTime)then{_jailTime = _maxTime};

_counter = 1;
_index = 1;
_tempIndex = 0;
{
	if(_forEachIndex > 0)then
		{
		_tempStr = _tempStr + format ["%1 count(s) of %2<br/>",(_x select 1),(_x select 0)];
		};
}forEach _charges;
	
_str = parseText format ["<t color='#4CCF00' size='1.5'>Criminal Information</t><br/><br/>
<t color='#FF0000'>%6</t><br/><br/>
<t color='#00BFFF'>Bounty:</t> $ %1<br/><br/>
<t color='#00BFFF'>Listed Crimes</t> <br/><br/>
%2<br/><br/>
<t color='#FFFF00'>Max Jail Time for this person</t><br/>
%3 Minutes<br/><br/>
<t color='#FFFF00'>Suggested Jail Time</t><br/>
%4 Minutes<br/><br/>
<t color='#FF0000'>%5</t>"

,[_charges select 0]call DS_fnc_numberText
,_tempStr
,_maxTime
,_jailTime
,_extraInfo
,_criminal
];

hint _str;
