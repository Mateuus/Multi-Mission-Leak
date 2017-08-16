/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/

private ["_tempStr","_jailTime","_maxTime","_gangHistory","_gangs","_str"];

params ["_charges","_criminal","_uid","_rebel","_rebelVeh"];

_tempStr = "";
_jailTime = _charges select 0;
_jailTime = (round(_jailTime/1000));
if(_jailTime isEqualTo 0)then{_jailTime = 1;};
if(_rebelVeh)then{_maxTime = 30;_jailTime = 30}else{if(_rebel)then{_maxTime = 25}else{_maxTime = 20};};
if(_jailTime > _maxTime)then{_jailTime = _maxTime};

{
	if(_forEachIndex > 0)then {
		_tempStr = _tempStr + format ["%1 count(s) of %2<br/>",(_x select 1),(_x select 0)];
	};
} forEach _charges;

_gangHistory = (DS_gangHistory select {(_x select 0) isEqualTo _uid}) select 0;
_gangs = if(!isNil "_gangHistory")then{_gangHistory select 1}else{"None"};

_str = parseText format ["<t color='#4CCF00' size='1.5'>Criminal Information</t><br/><br/>
<t color='#FF0000'>%1</t><br/><br/>
<t color='#00BFFF'>Gang History</t><br/><br/>
%2<br/><br/>
<t color='#00BFFF'>Bounty:</t> $ %3<br/><br/>
<t color='#00BFFF'>Listed Crimes</t><br/><br/>
%4<br/><br/>
<t color='#FFFF00'>Maximum Jail Time</t><br/>
%5 Minutes<br/><br/>
<t color='#FFFF00'>Suggested Jail Time</t><br/>
%6 Minutes<br/><br/>"
,_criminal
,_gangs
,[_charges select 0] call DS_fnc_numberText
,_tempStr
,_maxTime
,_jailTime
];

hint _str;