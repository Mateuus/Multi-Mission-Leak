/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	
	Description:
	Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_result = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",(_criminal select 0)];
waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_crimesDB = [(_queryResult select 0)] call DB_fnc_mresToArray;
if(typeName _crimesDb == "STRING") then {_crimesDb = call compile _crimesDb;};
_queryResult set[0,_crimesDb];
_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "187V": {_x = "Vehicular Manslaughter"};
		case "187": {_x = "Manslaughter"};
		case "901": {_x = "Escaping Jail"};
		case "261": {_x = "Rape"};
		case "261A": {_x = "Attempted Rape"};
		case "215": {_x = "Attempted Auto Theft"};
		case "213": {_x = "Use of illegal explosives"};
		case "211": {_x = "Robbery"};
		case "207": {_x = "Kidnapping"};
		case "207A": {_x = "Attempted Kidnapping"};
		case "390": {_x = "Public Intoxication"};
		case "487": {_x = "Grand Theft"};
		case "488": {_x = "Petty Theft"};
		case "480": {_x = "Hit and run"};
		case "481": {_x = "Drug Possession"};
		case "482": {_x = "Intent to distribute"};
		case "483": {_x = "Drug Trafficking"};
		case "459": {_x = "Burglary"};
		case "666": {_x = "Tax Evasion"};
		case "667": {_x = "Terrorism"};
		case "668": {_x = "Unlicensed Hunting"};
		case "919": {_x = "Organ Theft"};
		case "919A": {_x = "Attempted Organ Theft"};
		
		case "1": {_x = "Driving without Lights"};
		case "2": {_x = "Driving without License"};
		case "3": {_x = "Driving over the Speed"};
		case "4": {_x = "Reckless Driving"};
		case "5": {_x = "Driving Stolen Vehicle"};
		case "6": {_x = "Hit and Run"};
		case "7": {_x = "Attempted Murder"};
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_result];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

[[_queryResult],"life_fnc_wantedInfo",_ret,false] spawn life_fnc_MP;