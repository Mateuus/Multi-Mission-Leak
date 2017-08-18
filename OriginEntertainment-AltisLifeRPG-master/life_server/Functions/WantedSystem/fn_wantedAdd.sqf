/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	Persistence by: ColinM
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["187V",6500]};
	case "187": {_type = ["187",20000]};
	case "901": {_type = ["901",4500]};
	case "261": {_type = ["261",5000]};
	case "261A": {_type = ["261A",3000]};
	case "215": {_type = ["215",2000]};
	case "213": {_type = ["213",10000]};
	case "211": {_type = ["211",1000]};
	case "207": {_type = ["207",3500]};
	case "207A": {_type = ["207A",2000]};
	case "390": {_type = ["390",15000]};
	case "487": {_type = ["487",1500]};
	case "488": {_type = ["488",700]};
	case "480": {_type = ["480",1300]};
	case "481": {_type = ["481",1000]};
	case "482": {_type = ["482",5000]};
	case "483": {_type = ["483",9500]};
	case "459": {_type = ["459",6500]};
	case "666": {_type = ["666",2000]};
	case "667": {_type = ["667",45000]};
	case "668": {_type = ["668",15000]};
	case "919": {_type = ["919",20000]};
	case "919A": {_type = ["919A",18000]};
	
	case "1": {_type = ["1",350]};
    case "2": {_type = ["2",1500]};
    case "3": {_type = ["3",2500]};
    case "4": {_type = ["4",3500]};
    case "5": {_type = ["5",8000]};
    case "6": {_type = ["6",5000]};
	case "7": {_type = ["7",10000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
if(_customBounty != -1) then {_type set[1,_customBounty];};

_result = format["SELECT wantedID, wantedCrimes FROM wanted WHERE wantedID='%1'",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_name = [_name] call DB_fnc_mresString;
_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = [(_queryResult select 1)] call DB_fnc_mresToArray;
	_pastCrimes pushBack (_type select 0);
	_pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
	_query = format["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
} else {
	_crimes = [[(_type select 0)]] call DB_fnc_mresArray;
	_query = format["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1','%2','%3','%4', '1')",_uid,_name,_crimes,_val];
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};