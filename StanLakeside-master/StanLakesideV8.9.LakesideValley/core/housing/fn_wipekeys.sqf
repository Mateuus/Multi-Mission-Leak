#include <macro.h>
/*
	give a key wipekeys
	fn_wipekeys.sqf
*/

params [["_house", objNull, [objNull]]];

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(cash_in_hand < 5000) exitWith { ["You need $5000 dollars to change the locks.", false] spawn domsg; };

["cash","take",5000] call life_fnc_handleCash; 

_house setVariable["shared1",nil,true];
_house setVariable["shared2",nil,true];
_house setVariable["shared3",nil,true];
_house setVariable["shared4",nil,true];
_house setVariable["shared5",nil,true];

["Keys have been wiped, for people online with a set of keys, their keys will be removed on restart.", false] spawn domsg;
[_house] remoteExecCall ["TON_fnc_dowipekeys",(call life_fnc_HCC)];

