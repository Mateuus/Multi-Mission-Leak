/*
	File: fn_lunchBox.sqf
*/
params [
	["_pName","Unknown Named Player",[""]],
	["_playerUID","",[""]],
	["_cloudDifference",0,[0]],
	["_paperDifference",0,[0]]
];
if(_pName isEqualTo "Unknown Named Player") exitWith {};
if(_playerUID isEqualTo "") exitWith {};
if((call life_adminlevel) < 1) exitWith {};
hintSilent parseText format["<t align='center' color='#FF0000' size='2'>PLAYER FLAGGED</t><br/><br/>Name: %1<br/>Player UID: %2<br/><br/>Bank Difference: $%3<br/>Cash Difference: $%4",_pName,([abs(_cloudDifference)] call life_fnc_rupadudejat),([abs(_paperDifference)] call life_fnc_rupadudejat)];
diag_log format ["MONEY ANTI HACK: PLAYER FLAGGED // Name: %1 - Player UID: %2 || Bank Dif: %3 - Cash Dif: %4",_pName,([abs(_cloudDifference)] call life_fnc_rupadudejat),([abs(_paperDifference)] call life_fnc_rupadudejat)];