#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_result = format["wantedFetchCrimes:%1",_criminal select 0];
waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "187V": {_x = "STR_Crime_187V"};
		case "187": {_x = "STR_Crime_187"};
		case "901": {_x = "STR_Crime_901"};
		case "215": {_x = "STR_Crime_215"};
		case "213": {_x = "STR_Crime_213"};
		case "211": {_x = "STR_Crime_211"};
		case "207": {_x = "STR_Crime_207"};
		case "207A": {_x = "STR_Crime_207A"};
		case "390": {_x = "STR_Crime_390"};
		case "487": {_x = "STR_Crime_487"};
		case "488": {_x = "STR_Crime_488"};
		case "480": {_x = "STR_Crime_480"};
		case "481": {_x = "STR_Crime_481"};
		case "482": {_x = "STR_Crime_482"};
		case "483": {_x = "STR_Crime_483"};
		case "459": {_x = "STR_Crime_459"};
		case "666": {_x = "STR_Crime_666"};
		case "667": {_x = "STR_Crime_667"};
		case "668": {_x = "STR_Crime_668"};
		case "919": {_x = "STR_Crime_919"};
		case "919A": {_x = "STR_Crime_919A"};

		case "1": {_x = "STR_Crime_1"};
		case "2": {_x = "STR_Crime_2"};
		case "3": {_x = "STR_Crime_3"};
		case "4": {_x = "STR_Crime_4"};
		case "5": {_x = "STR_Crime_5"};
		case "6": {_x = "STR_Crime_6"};
		case "7": {_x = "STR_Crime_7"};
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Wanted Query Request -------------",
		format["QUERY: %1",_result],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

[[_queryResult],"life_fnc_wantedInfo",_ret,false] spawn life_fnc_MP;